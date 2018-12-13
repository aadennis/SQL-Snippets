SELECT ss.sum_execution_count 
,t.TEXT 
,ss.sum_total_elapsed_time 
,ss.sum_total_worker_time 
,ss.sum_total_logical_reads 
,ss.sum_total_logical_writes 
FROM (SELECT s.plan_handle 
,SUM(s.execution_count) sum_execution_count 
SUM(s.elapsed_time) sum_total_elapsed_time 
SUM(s.total_worker_time) sum_total_worker_time 
SUM(s.tota1_logical_reads) sum total logical reads 
SUM(s.tota1_logical_writes) sum_total_logical_writes 
FROM sys. dm exec_query_stats s 
CROUP BY s.plan_handle 
) AS ss 
CROSS APPLY sys.dm exec_sql_text(ss.plan handle) t 
ORDER BY sum total_logical reads DESC 
