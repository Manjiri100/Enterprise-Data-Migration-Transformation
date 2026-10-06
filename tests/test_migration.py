from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data" / "sample"

def test_sample_files_exist():
    for name in ["employees_legacy.csv", "positions_legacy.csv", "organisations.csv", "locations.csv", "employee_alt_source.csv"]:
        assert (DATA / name).exists()

def test_duplicate_employee_case_exists():
    df = pd.read_csv(DATA / "employees_legacy.csv", dtype=str)
    assert df["employee_id"].duplicated().any()

def test_reference_keys_unique():
    for name, key in [("organisations.csv","organisation_id"),("locations.csv","location_id"),("positions_legacy.csv","position_id")]:
        df = pd.read_csv(DATA / name, dtype=str)
        assert df[key].is_unique

def test_known_invalid_date_case_exists():
    df = pd.read_csv(DATA / "employees_legacy.csv", dtype=str)
    row = df[df.employee_id == "E1009"].iloc[0]
    assert row.end_date < row.start_date
