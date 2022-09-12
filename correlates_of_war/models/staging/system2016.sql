-- staging.system2016

{{ config(MATERIALIZED = 'table') }}

WITH source as (

    select * from {{ source('sources','system2016') }}

),

renamed AS (
		SELECT 
            stateabb AS state_abbr,
			ccode AS country_code,
			year::INTEGER as year
		FROM source
		)

SELECT *
FROM renamed
