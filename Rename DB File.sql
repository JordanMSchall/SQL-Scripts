use [DB_NAME]
GO
SELECT file_id, name as [logical_file_name], physical_name
FROM sys.database_files
/*
DB_NAME       F:\DB_NAME.mdf
DB_NAME_log       S:\SQLlog\DB_NAME.LDF
*/

USE [master];
GO
--Disconnect all existing session.
ALTER DATABASE [DB_NAME] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
GO
--Change database in to OFFLINE mode.
ALTER DATABASE [DB_NAME] SET OFFLINE
GO
ALTER DATABASE [DB_NAME] FILE (Name='DB_NAME', FILENAME='F:\DB_NAME.mdf')
GO
ALTER DATABASE [DB_NAME] FILE (Name='DB_NAME_log', FILENAME='S:\SQLlog\DB_NAME_log.ldf')

---Physcially rename the files here BEFORE GOING any further
GO
ALTER DATABASE [DB_NAME] SET ONLINE
Go
ALTER DATABASE [DB_NAME] SET MULTI_USER
Go