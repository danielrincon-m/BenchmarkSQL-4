USE master;
ALTER DATABASE benchmarksqldb 
SET SINGLE_USER 
WITH ROLLBACK IMMEDIATE;
DROP DATABASE benchmarksqldb;