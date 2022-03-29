with epics as (
	select 
	*
	from jira.raw_epics
), formatted as (

	select 
		id epic_id, 
		key epic_key,
		projectkey project_key,
		fields::json->>'summary' "name",
	   fields::json->'status'->'statusCategory'->>'name' as status_category
	from epics
)

select * from formatted
;
