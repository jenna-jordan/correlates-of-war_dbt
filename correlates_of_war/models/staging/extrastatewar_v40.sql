-- cleaned.extrastatewar_v40

{{ config(MATERIALIZED = 'table') }}

WITH source as (

    select * from {{ source('original','extrastatewar_v40') }}

),

renamed AS (
		SELECT 
			TRIM("WarNum") as war_id,
			TRIM("WarName") as war_name,
			TRIM("WarType") as war_type,
			TRIM("ccode1") as country_code_1,
			TRIM("SideA") as side_a,
			TRIM("ccode2") as country_code_2,
			TRIM("SideB") as side_b,
			{{ resolve_date_columns('StartYear1', 'StartMonth1', 'StartDay1') }} as start_date_1,
			{{ resolve_date_precision('StartYear1', 'StartMonth1', 'StartDay1') }} as start_date_1_prec,
			{{ resolve_date_columns('EndYear1', 'EndMonth1', 'EndDay1') }} as end_date_1,
			{{ resolve_date_precision('EndYear1', 'EndMonth1', 'EndDay1') }} as end_date_1_prec,
			{{ resolve_date_columns('StartYear2', 'StartMonth2', 'StartDay2') }} as start_date_2,
			{{ resolve_date_precision('StartYear2', 'StartMonth2', 'StartDay2') }} as start_date_2_prec,
			{{ resolve_date_columns('EndYear2', 'EndMonth2', 'EndDay2 ') }} as end_date_2,
			{{ resolve_date_precision('EndYear2', 'EndMonth2', 'EndDay2 ') }} as end_date_2_prec,
			TRIM("Initiator") as initiator,
			TRIM("Interven") as is_intervention,
			TRIM("TransFrom") as transition_from,
			TRIM("Outcome") as outcome,
			TRIM("TransTo") as transition_to,
			TRIM("WhereFought") as where_fought,
			TRIM("BatDeath") as battle_deaths,
			TRIM("NonStateDeaths") as nonstate_deaths,
		FROM source
		)

SELECT *
FROM renamed
