use InstanceStatistics
go

--https://docs.microsoft.com/en-us/sql/t-sql/functions/serverproperty-transact-sql?view=sql-server-2017
--https://github.com/MicrosoftDocs/sql-docs/blob/live/docs/t-sql/functions/serverproperty-transact-sql.md

declare @properties table (propertyName nvarchar(100), propertyValue nvarchar(1000));

insert into @properties (propertyName, propertyValue)
			select 'Sql Version', @@VERSION
union all	select 'Server Name', @@SERVERNAME
union all	select 'MachineName', convert(nvarchar,SERVERPROPERTY('MachineName'))
union all	select 'BuildClrVersion', convert(nvarchar,SERVERPROPERTY('BuildClrVersion'))
union all	select 'Collation', convert(nvarchar,SERVERPROPERTY('Collation'))
union all	select 'CollationID', convert(nvarchar,SERVERPROPERTY('CollationID'))
union all	select 'ComputerNamePhysicalNetBIOS', convert(nvarchar,SERVERPROPERTY('ComputerNamePhysicalNetBIOS'))
union all	select 'Edition', convert(nvarchar,SERVERPROPERTY('Edition'))
union all	select 'EngineEdition', convert(nvarchar,SERVERPROPERTY('EngineEdition'))
union all	select 'HadrManagerStatus', convert(nvarchar,SERVERPROPERTY('HadrManagerStatus'))
union all	select 'InstanceDefaultDataPath', convert(nvarchar,SERVERPROPERTY('InstanceDefaultDataPath'))
union all	select 'InstanceDefaultLogPath', convert(nvarchar,SERVERPROPERTY('InstanceDefaultLogPath'))
union all	select 'InstanceName', convert(nvarchar,SERVERPROPERTY('InstanceName'))
union all	select 'IsClustered', convert(nvarchar,SERVERPROPERTY('IsClustered'))
union all	select 'IsHadrEnabled', convert(nvarchar,SERVERPROPERTY('IsHadrEnabled'))
union all	select 'IsIntegratedSecurityOnly', convert(nvarchar,SERVERPROPERTY('IsIntegratedSecurityOnly'))
union all	select 'IsLocalDB', convert(nvarchar,SERVERPROPERTY('IsLocalDB'))
union all	select 'IsSingleUser', convert(nvarchar,SERVERPROPERTY('IsSingleUser'))
union all	select 'IsXTPSupported', convert(nvarchar,SERVERPROPERTY('IsXTPSupported'))
union all	select 'MachineName', convert(nvarchar,SERVERPROPERTY('MachineName'))
union all	select 'ProcessID', convert(nvarchar,SERVERPROPERTY('ProcessID'))
union all	select 'ProductBuild', convert(nvarchar,SERVERPROPERTY('ProductBuild'))
union all	select 'ProductBuildType', convert(nvarchar,SERVERPROPERTY('ProductBuildType'))
union all	select 'ProductLevel', convert(nvarchar,SERVERPROPERTY('ProductLevel'))
union all	select 'ProductMajorVersion', convert(nvarchar,SERVERPROPERTY('ProductMajorVersion'))
union all	select 'ProductMinorVersion', convert(nvarchar,SERVERPROPERTY('ProductMinorVersion'))
union all	select 'ProductUpdateLevel', convert(nvarchar,SERVERPROPERTY('ProductUpdateLevel'))
union all	select 'ProductUpdateReference', convert(nvarchar,SERVERPROPERTY('ProductUpdateReference'))
union all	select 'ProductVersion', convert(nvarchar,SERVERPROPERTY('ProductVersion'))
union all	select 'ResourceLastUpdateDateTime', convert(nvarchar,SERVERPROPERTY('ResourceLastUpdateDateTime'))
union all	select 'ResourceVersion', convert(nvarchar,SERVERPROPERTY('ResourceVersion'))
union all	select 'ServerName', convert(nvarchar,SERVERPROPERTY('ServerName'))
union all	select 'SqlCharSetName', convert(nvarchar,SERVERPROPERTY('SqlCharSetName'))
union all	select 'SqlSortOrder', convert(nvarchar,SERVERPROPERTY('SqlSortOrder'))
union all	select 'SqlSortOrderName', convert(nvarchar,SERVERPROPERTY('SqlSortOrderName'))
;

select * from @properties;
