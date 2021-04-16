-- Drops all tables and schema.

-- drop table benchmarksql.warehouse;

-- drop table benchmarksql.item;

-- drop table benchmarksql.stock;

-- drop table benchmarksql.district;

-- drop table benchmarksql.customer;

-- drop table benchmarksql.oorder;

-- drop table benchmarksql.order_line;

-- drop table benchmarksql.history;

-- drop table benchmarksql.new_order;

-- DROP SCHEMA IF EXISTS benchmarksql;

-- Deletes the Schema if exists

DECLARE @SQL        NVARCHAR(2000)
DECLARE @SchemaName NVARCHAR(100)
DECLARE @Counter    INT
DECLARE @TotalRows  INT

SET @SchemaName = 'benchmarksql'
SET @Counter = 1

SET @SQL='
SELECT ''DROP TABLE '' + S.[Name] + ''.'' + O.[Name] AS DropTableStatement
FROM SYS.OBJECTS AS O INNER JOIN SYS.SCHEMAS AS S ON O.[schema_id] = S.[schema_id]
WHERE O.TYPE = ''U'' AND S.[Name] = ''' + @SchemaName + ''''

DROP TABLE IF EXISTS #DropStatements

CREATE TABLE #DropStatements
(
    ID                  INT IDENTITY (1, 1),
    DropTableStatement  VARCHAR(2000)
)

INSERT INTO #DropStatements
EXEC (@SQL)

SELECT @TotalRows = COUNT(ID) FROM #DropStatements

WHILE @Counter <= @TotalRows
BEGIN
    SELECT @SQL = DropTableStatement FROM #DropStatements WHERE ID = @Counter

    PRINT @SQL
    EXEC (@SQL)

    SET @Counter = @Counter + 1
END

SET @SQL = N'DROP SCHEMA IF EXISTS ' + @SchemaName
PRINT @SQL
EXEC (@SQL);

--Delete sequences

DROP SEQUENCE IF EXISTS hist_id_seq;