{% macro resolve_date_columns(year_col, month_col, day_col) -%}

{% set null_values = ["-7", "-8", "-9"] %}

{% if year_col IN null_values %}

    NULL 

{% else %}
    
    with date_corrections as (
        SELECT 
            year_col::INTEGER,
            CASE
                WHEN month_col IN null_values THEN 1
                ELSE month_col::INTEGER 
            END AS month_col,
            CASE
                WHEN day_col IN null_values THEN 1
                ELSE day_col::INTEGER 
            END AS day_col
    ), 

    SELECT make_date(year_col::INTEGER, month_col::INTEGER, day_col::INTEGER)
    FROM date_corrections

{%- endif -%}

{%- endmacro %}