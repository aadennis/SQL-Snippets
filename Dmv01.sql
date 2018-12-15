with dmv_sums as (
SELECT 
 t.dbid, DB_NAME(t.dbid) dbname
,t.TEXT
,ss.sum_execution_count 
,ss.sum_total_elapsed_time stel
,ss.sum_total_worker_time stwt
,ss.sum_total_logical_reads  stlr
,ss.sum_total_logical_writes  stlw
FROM (SELECT s.plan_handle 
,SUM(s.execution_count) sum_execution_count 
,SUM(s.total_elapsed_time) sum_total_elapsed_time 
,SUM(s.total_worker_time) sum_total_worker_time 
,SUM(s.total_logical_reads) sum_total_logical_reads 
,SUM(s.total_logical_writes) sum_total_logical_writes 
FROM sys.dm_exec_query_stats s 
GROUP BY s.plan_handle 
) AS ss 
CROSS APPLY sys.dm_exec_sql_text(ss.plan_handle) t 
) select *  from dmv_sums
ORDER BY stlr DESC 
