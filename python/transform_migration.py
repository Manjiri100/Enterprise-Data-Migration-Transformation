from pathlib import Path
import pandas as pd

ROOT = Path(__file__).resolve().parents[1]
BASE = ROOT / "data" / "sample"
OUT = ROOT / "target_preview.csv"

def main():
    employees = pd.read_csv(BASE / "employees_legacy.csv", dtype=str).fillna("")
    organisations = pd.read_csv(BASE / "organisations.csv", dtype=str).fillna("")
    locations = pd.read_csv(BASE / "locations.csv", dtype=str).fillna("")

    # Keep the first occurrence of an employee key and flag the rest as exceptions.
    employees = employees.drop_duplicates(subset=["employee_id"], keep="first")
    employees["employee_name"] = employees["employee_name"].str.strip()
    employees["migration_status"] = "Ready for validation"

    employees = employees.merge(organisations[["organisation_id", "organisation_name", "department_code"]],
                                on="organisation_id", how="left")
    employees = employees.merge(locations[["location_id", "location_name", "country"]],
                                on="location_id", how="left")

    employees["migration_status"] = employees.apply(
        lambda r: "Exception" if not r["employee_name"] or not r["organisation_name"] else r["migration_status"], axis=1
    )
    employees.to_csv(OUT, index=False)
    print(f"Wrote {len(employees)} transformed employee records to {OUT}")

if __name__ == "__main__":
    main()
