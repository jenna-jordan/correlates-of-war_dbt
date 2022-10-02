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
DROP SCHEMA IF EXISTS original CASCADE;
CREATE SCHEMA original;
CREATE TABLE original.states2016 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/states2016.csv', ALL_VARCHAR=TRUE);
CREATE TABLE original.system2016 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/system2016.csv', ALL_VARCHAR=TRUE);
CREATE TABLE original.majors2016 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/majors2016.csv', ALL_VARCHAR=TRUE);
CREATE TABLE original.interstatewar_v40 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/Inter-StateWarData_v4.0.csv', ALL_VARCHAR=TRUE);
CREATE TABLE original.nonstatewar_v40 AS 
    SELECT * FROM read_csv_auto('./duckdb/data/Non-StateWarData_v4.0.csv', ALL_VARCHAR=TRUE);
CREATE TABLE original.intrastatewar_v51 AS 
    SELECT * FROM dfIntraStateWar;
CREATE TABLE original.extrastatewar_v40 AS 
    SELECT * FROM dfExtraStateWar;
"""

conn.execute(table_creates)
conn.close()
