-- cleaned.system2016

{{ config(MATERIALIZED = 'table') }}

WITH source as (

    select * from {{ source('original','system2016') }}

),

renamed AS (
		SELECT 
            trim(stateabb) AS state_abbr,
			trim(ccode) AS country_code,
			year::INTEGER as year
		FROM source
		)

SELECT *
FROM renamed
