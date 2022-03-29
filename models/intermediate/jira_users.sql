with users as (
	select 
	*
	from jira.raw_users
), formatted as (

	select 
		accountid user_id, 
		displayname display_name, 
		name, 
		emailaddress email, 
		accounttype account_type,
		active
	from users
)

select * from formatted

