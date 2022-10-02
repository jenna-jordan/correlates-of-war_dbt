-- cleaned.states2016

{{ config(MATERIALIZED = 'table') }}

WITH source as (

    select * from {{ source('original','states2016') }}

),

renamed AS (
		SELECT 
            trim(stateabb) AS state_abbr,
			trim(ccode) AS country_code,
			trim(statenme) AS state_name,
			make_date(styear::INTEGER, stmonth::INTEGER, stday::INTEGER) AS start_date,
			make_date(endyear::INTEGER, endmonth::INTEGER, endday::INTEGER) AS end_date
		FROM source
		)

SELECT *
FROM renamed
