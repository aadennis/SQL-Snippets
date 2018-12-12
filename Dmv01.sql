ss. sum execution count 
,t.TEXT 
, ss. sum total_elapsed_time 
,ss.sum total worker tire 
,ss.sum total _ logical _ reads 
,ss.sum total_logical_writes 
FROM  (SELECT s. plan _ handle 
SUM(s. execution_count) sum execution_count 
elapsed_tire) sum total elapsed time 
SLIM(s. total worker _ time) sum 
SUM(s.tota1 logical _ reads) sum total logical reads 
SUM(s.tota1 logical_writes) sum_total_logical_writes 
FROM sys. dm exec_query_stats s 
CROUP BY s.plan_handle 
) AS ss 
CROSS APPLY sys.dm exec_sql_text(ss.plan handle) t 
ORDER BY sum total_logical reads DESC 
