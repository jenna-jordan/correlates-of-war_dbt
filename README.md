# correlates-of-war_dbt
dbt project for the Correlates of War data

## Environment set up

```
conda env create --name dbt-cow python=3.10
pip install dbt-duckdb
pip install duckcli
pip install sqlfluff
conda install pandas
```

## dbt project setup

In repo root, ran:

```
dbt init
correlates_of_war # Enter name of project
1 # select duckdb as database
```

