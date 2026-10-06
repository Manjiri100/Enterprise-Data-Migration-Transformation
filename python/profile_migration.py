from pathlib import Path
import pandas as pd

BASE = Path(__file__).resolve().parents[1] / "data" / "sample"
FILES = ["employees_legacy.csv", "positions_legacy.csv", "organisations.csv", "locations.csv", "employee_alt_source.csv"]

def profile(path: Path) -> None:
    df = pd.read_csv(path, dtype=str, keep_default_na=False)
    print(f"\n{path.name}: {len(df):,} rows x {len(df.columns)} columns")
    print("Duplicate rows:", int(df.duplicated().sum()))
    missing = (df == "").sum().sort_values(ascending=False)
    print("Missing values:")
    print(missing[missing > 0].to_string() if (missing > 0).any() else "None")

if __name__ == "__main__":
    for name in FILES:
        profile(BASE / name)
