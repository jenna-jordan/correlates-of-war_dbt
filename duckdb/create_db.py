import duckdb
import pandas as pd

# these files don't use UTF-8 encoding, so I need to use pandas to read them in
dfIntraStateWar = pd.read_csv(
    "./duckdb/data/INTRA-STATE WARS v5.1 CSV.csv",
    encoding="latin-1",
    dtype=str,
)
dfExtraStateWar = pd.read_csv(
    "./duckdb/data/Extra-StateWarData_v4.0.csv",
    encoding="latin-1",
    dtype=str,
)


conn = duckdb.connect("cow.db", read_only=False)

table_creates = """
DROP SCHEMA IF EXISTS sources CASCADE;
CREATE SCHEMA sources;
CREATE TABLE sources.states2016 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/states2016.csv', ALL_VARCHAR=TRUE);
CREATE TABLE sources.system2016 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/system2016.csv', ALL_VARCHAR=TRUE);
CREATE TABLE sources.majors2016 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/majors2016.csv', ALL_VARCHAR=TRUE);
CREATE TABLE sources.interstatewar_v40 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/Inter-StateWarData_v4.0.csv', ALL_VARCHAR=TRUE);
CREATE TABLE sources.nonstatewar_v40 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/Non-StateWarData_v4.0.csv', ALL_VARCHAR=TRUE);
CREATE TABLE sources.intrastatewar_v51 AS 
    SELECT * FROM dfIntraStateWar;
CREATE TABLE sources.extrastatewar_v40 AS 
    SELECT * FROM dfExtraStateWar;
"""

conn.execute(table_creates)
conn.close()
