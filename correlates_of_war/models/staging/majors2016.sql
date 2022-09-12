-- staging.majors2016

{{ config(MATERIALIZED = 'table') }}

WITH source as (

    select * from {{ source('sources','majors2016') }}

),

renamed AS (
		SELECT 
            stateabb AS state_abbr,
			ccode AS country_code,
			make_date(styear::INTEGER, stmonth::INTEGER, stday::INTEGER) AS start_date,
			make_date(endyear::INTEGER, endmonth::INTEGER, endday::INTEGER) AS end_date
		FROM source
		)

SELECT *
FROM renamed