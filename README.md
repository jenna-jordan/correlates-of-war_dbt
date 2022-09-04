# correlates-of-war_dbt
dbt project for the Correlates of War data

## Setup

### Environment set up

```
conda env create --name dbt-cow python=3.10
pip install dbt-duckdb
pip install duckcli
pip install sqlfluff
conda install pandas
conda install dbt-core=1.1
```

### dbt project setup

In repo root, ran:

```
dbt init
correlates_of_war # Enter name of project
1 # select duckdb as database
```
Create `.sqlfluff` and `.sqlfluffignore` following the directions at: https://docs.sqlfluff.com/en/stable/configuration.html#dbt-project-configuration

Create `profiles.yml` in dbt project root and specify path to cow.db.
Then, cd into `correlates_of_war_dbt/correlates_of_war/` (dbt project) directory and run in CLI:
```
cp profiles.yml ~/.dbt/profiles.yml
```
This creates/replaces the profile.yml file that is actually used by dbt with the profile.yml file saved in the repo.

Create `packages.yml` in dbt project root and add packages dbt-utils, dbt-expectations, and codegen

Create the folders in models/ (see Organization)

Create `sources.yml` in models folder, generated using codegen CLI command:
```
dbt run-operation generate_source --args '{"schema_name": "sources", "generate_columns": True, "include_descriptions": True}'
```

Create custom macro `generate_schema_name.sql` so that schema names don't have a prefix (as documented here: https://docs.getdbt.com/docs/building-a-dbt-project/building-models/using-custom-schemas)

### DuckDB setup

Copied CSV files into `duckdb/data/` and ran the script `duckdb/create_db.py`

## Organization

### dbt models

- Staging
- Normalized
- Intermediate (?)
- Marts (?)

### database schemas

- `sources`: where all CSV files will be loaded
    - note: may end up using seeds instead
- `staging`: where the cleaned up data will go before it has been substatially reorganized
- `normalized`: where the fully normalized data will live, with PK and FK tests/constraints
- ?