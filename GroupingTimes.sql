;with createDateGroup as (
	select datepart(HOUR,create_date) cdHour
	,datepart(MINUTE,create_date) cdMinute
	,datepart(SECOND,create_date) cdSecond
	from sys.all_views
	) 
	select count(1) createDateGroupCount, * 
	from createDateGroup
	group by cdHour, cdMinute, cdSecond
	order by cdHour, cdMinute, cdSecond;
  
  
