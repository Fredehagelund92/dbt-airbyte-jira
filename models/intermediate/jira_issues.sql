with issues as (
	select 
	*
	from jira.raw_issues raw
	

	
), formatted as (

	SELECT 
	   id issue_id,
	   key issue_key,
	   fields::json->'issuetype'->>'name' issue_type,
	   fields::json->'project'->>'id' as project_id,
	   fields::json->'status'->>'name' as status,
	   fields::json->'status'->'statusCategory'->>'name' as status_category,
	   fields::json->>'summary' summary,
	   fields::json->'priority'->>'name' priority,
	   fields::json->'assignee'->>'accountId' assignee_id,
	   fields::json->'creator'->>'accountId'  creator_id,
	   to_timestamp(fields::json->>'created', 'YYYY-MM-DD hh24:mi:ss') created_at
	FROM issues

)

select * from formatted
;
