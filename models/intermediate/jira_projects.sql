with projects as (
	select 
	*
	from jira.raw_projects
), formatted as (

	select 
		id project_id, 
		key project_key, 
		name, 
		isprivate is_private,
		 projectcategory::json->>'name' category
	from projects
)

select * from formatted
