# dbt Transformation Layer

The dbt project represents the migration transformation layer as:

**Sources → Staging → Intermediate → Marts**

The SQL models are intentionally simple enough to inspect locally while demonstrating production-style separation of concerns.

The included `load_sample_data.py` utility creates a local DuckDB database from the sample CSVs so the models have a reproducible local execution environment.
