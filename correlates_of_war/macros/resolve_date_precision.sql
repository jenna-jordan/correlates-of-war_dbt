{% macro resolve_date_precision(year_col, month_col, day_col) -%}

{% set null_values = ["-7", "-8", "-9"] %}

{% if year_col IN null_values %}

    NULL 

{% elif month_col IN null_values %}

    'year'

{% elif day_col IN null_values %}

    'month'

{% else %}

    'day'

{%- endif -%}

{%- endmacro %}