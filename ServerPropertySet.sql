use InstanceStatistics
go

--https://docs.microsoft.com/en-us/sql/t-sql/functions/serverproperty-transact-sql?view=sql-server-2017
--https://github.com/MicrosoftDocs/sql-docs/blob/live/docs/t-sql/functions/serverproperty-transact-sql.md

declare @properties table (propertyName nvarchar(100), propertyValue nvarchar(1000), comments nvarchar(500) default null);

insert into @properties (propertyName, propertyValue, comments)
			select 'Sql Version', @@VERSION, 'concatenation of the production semantic numbering'
union all	select 'Server Name', @@SERVERNAME, 'trustworthy?'
union all	select 'MachineName', convert(nvarchar,SERVERPROPERTY('MachineName')), null
union all	select 'BuildClrVersion', convert(nvarchar,SERVERPROPERTY('BuildClrVersion')), null
union all	select 'Collation', convert(nvarchar,SERVERPROPERTY('Collation')), null
union all	select 'CollationID', convert(nvarchar,SERVERPROPERTY('CollationID')), null
union all	select 'ComputerNamePhysicalNetBIOS', convert(nvarchar,SERVERPROPERTY('ComputerNamePhysicalNetBIOS')), null
union all	select 'Edition', convert(nvarchar,SERVERPROPERTY('Edition')), null
union all	select 'EngineEdition', convert(nvarchar,SERVERPROPERTY('EngineEdition')), null
union all	select 'HadrManagerStatus', convert(nvarchar,SERVERPROPERTY('HadrManagerStatus')), null
union all	select 'InstanceDefaultDataPath', convert(nvarchar,SERVERPROPERTY('InstanceDefaultDataPath')), null
union all	select 'InstanceDefaultLogPath', convert(nvarchar,SERVERPROPERTY('InstanceDefaultLogPath')), null
union all	select 'InstanceName', convert(nvarchar,SERVERPROPERTY('InstanceName')), null
union all	select 'IsClustered', convert(nvarchar,SERVERPROPERTY('IsClustered')), null
union all	select 'IsHadrEnabled', convert(nvarchar,SERVERPROPERTY('IsHadrEnabled')), null
union all	select 'IsIntegratedSecurityOnly', convert(nvarchar,SERVERPROPERTY('IsIntegratedSecurityOnly')), null
union all	select 'IsLocalDB', convert(nvarchar,SERVERPROPERTY('IsLocalDB')), null
union all	select 'IsSingleUser', convert(nvarchar,SERVERPROPERTY('IsSingleUser')), null
union all	select 'IsXTPSupported', convert(nvarchar,SERVERPROPERTY('IsXTPSupported')), null
union all	select 'MachineName', convert(nvarchar,SERVERPROPERTY('MachineName')), null
union all	select 'ProcessID', convert(nvarchar,SERVERPROPERTY('ProcessID')), null
union all	select 'ProductBuild', convert(nvarchar,SERVERPROPERTY('ProductBuild')), null
union all	select 'ProductBuildType', convert(nvarchar,SERVERPROPERTY('ProductBuildType')), null
union all	select 'ProductLevel', convert(nvarchar,SERVERPROPERTY('ProductLevel')), null
union all	select 'ProductMajorVersion', convert(nvarchar,SERVERPROPERTY('ProductMajorVersion')), null
union all	select 'ProductMinorVersion', convert(nvarchar,SERVERPROPERTY('ProductMinorVersion')), null
union all	select 'ProductUpdateLevel', convert(nvarchar,SERVERPROPERTY('ProductUpdateLevel')), null
union all	select 'ProductUpdateReference', convert(nvarchar,SERVERPROPERTY('ProductUpdateReference')), null
union all	select 'ProductVersion', convert(nvarchar,SERVERPROPERTY('ProductVersion')), null
union all	select 'ResourceLastUpdateDateTime', convert(nvarchar,SERVERPROPERTY('ResourceLastUpdateDateTime')), null
union all	select 'ResourceVersion', convert(nvarchar,SERVERPROPERTY('ResourceVersion')), null
union all	select 'ServerName', convert(nvarchar,SERVERPROPERTY('ServerName')), null
union all	select 'SqlCharSetName', convert(nvarchar,SERVERPROPERTY('SqlCharSetName')), null
union all	select 'SqlSortOrder', convert(nvarchar,SERVERPROPERTY('SqlSortOrder')), null
union all	select 'SqlSortOrderName', convert(nvarchar,SERVERPROPERTY('SqlSortOrderName')), null
;

select * from @properties;

exec sys.xp_readerrorlog 0,1,N'detected',N'socket';

