from pathlib import Path
import duckdb

ROOT = Path(__file__).resolve().parents[1]
DATA = ROOT / "data" / "sample"
TARGET = ROOT / "dbt" / "target"
TARGET.mkdir(exist_ok=True)
DB = TARGET / "migration.duckdb"

TABLES = {
    "employees_legacy": "employees_legacy.csv",
    "positions_legacy": "positions_legacy.csv",
    "organisations": "organisations.csv",
    "locations": "locations.csv",
    "employee_alt_source": "employee_alt_source.csv",
}

def main():
    con = duckdb.connect(str(DB))
    for table, filename in TABLES.items():
        path = (DATA / filename).as_posix()
        con.execute(f"CREATE OR REPLACE TABLE {table} AS SELECT * FROM read_csv_auto(?)", [path])
    print(f"Loaded {len(TABLES)} source tables into {DB}")
    con.close()

if __name__ == "__main__":
    main()
