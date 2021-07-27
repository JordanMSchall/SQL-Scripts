CREATE TABLE #sp_who2 (SPID INT,Status VARCHAR(255),
      Login  VARCHAR(255),HostName  VARCHAR(255),
      BlkBy  VARCHAR(255),DBName  VARCHAR(255),
      Command VARCHAR(255),CPUTime INT,
      DiskIO INT,LastBatch VARCHAR(255),
      ProgramName VARCHAR(255),SPID2 INT,
      REQUESTID INT)
INSERT INTO #sp_who2 EXEC sp_who2


SELECT      *
FROM        #sp_who2
where login like 'ptidev' or login like 'ptiadmin' or login like 'dpsuser'
order by CPUTime desc

drop table #sp_who2

dbcc inputbuffer(52)
--kill 189