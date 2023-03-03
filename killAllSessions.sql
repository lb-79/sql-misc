USE Master
GO
DECLARE @dbName SYSNAME
DECLARE @sqlCmd VARCHAR(MAX)

SET @sqlCmd = ''
SET @dbName = 'WideWorldImporters' --change db name here

SELECT @sqlCmd = @sqlCmd + 'KILL ' + CAST(session_id AS VARCHAR) + CHAR(13)
FROM sys.dm_exec_sessions
WHERE DB_NAME(database_id) = @dbName

PRINT @sqlCmd

--Uncomment below to kill
--EXEC @sqlCmd