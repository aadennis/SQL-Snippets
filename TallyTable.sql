-- Create a tally table populated with n rows
-- There may be faster and/or simpler ways, but that is not a requirement here.
-- On my pc (SSD), the combination of 10 million inserts and the subsequent count takes about 25 seconds
-- setup
drop table InstanceStatistics.dbo.TallyTable;
create table InstanceStatistics.dbo.TallyTable (col1 bigint identity, col2 tinyint);
-- the run
with x as (select top 100000 a.object_id 
from master.sys.all_columns a cross apply master.sys.all_columns b)
insert into InstanceStatistics.dbo.TallyTable (col2) select null from x;
-- check
select count(1) from InstanceStatistics.dbo.TallyTable

-- And example usage... 
-- The top 100 n part must of course be <= the total in the Tally Table

drop table InstanceStatistics.dbo.SomeBusinessTable;
create table InstanceStatistics.dbo.SomeBusinessTable (SupplierId bigint primary key, SupplierName nvarchar(1000));

insert into InstanceStatistics.dbo.SomeBusinessTable
(SupplierId, SupplierName)
select top 100 col1, 'Supplier name ' +convert(nvarchar(1000), col1)
from InstanceStatistics.dbo.TallyTable

select * from InstanceStatistics.dbo.SomeBusinessTable;
