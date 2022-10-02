-- cleaned.states2016

{{ config(MATERIALIZED = 'table') }}

WITH source as (

    select * from {{ source('original','states2016') }}

),

renamed AS (
		SELECT 
            stateabb AS state_abbr,
			ccode AS country_code,
			statenme AS state_name,
			make_date(styear::INTEGER, stmonth::INTEGER, stday::INTEGER) AS start_date,
			make_date(endyear::INTEGER, endmonth::INTEGER, endday::INTEGER) AS end_date
		FROM source
		)

SELECT *
FROM renamed
