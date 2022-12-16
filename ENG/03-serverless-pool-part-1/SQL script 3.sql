
SELECT
    TOP 100 *
FROM
    OPENROWSET(
        BULK 'https://dlsyntestmm.dfs.core.windows.net/container01/sanfrancisco/csv/year=2001/month=01/day_month=01/part-00000-a4a63e02-58c5-4761-84fa-7ad7f167a91a.c000.csv',
        FORMAT = 'CSV',
        PARSER_VERSION = '2.0',
        FIELDTERMINATOR = '|',
        HEADER_ROW = TRUE
    ) WITH (
         [dataType] varchar(50) 1           
        ,[dateTime] datetime2 3
        ,[address] varchar(100) 7
        ,[latitude] float 8
        ,[longitude] float 9
    ) AS [result]