CREATE DATABASE DataExplorationDB 
                COLLATE Latin1_General_100_BIN2_UTF8

USE DataExplorationDB

CREATE EXTERNAL DATA SOURCE SanFranciscoLake
WITH ( LOCATION = 'https://dlsyntestmm.dfs.core.windows.net/container01/sanfrancisco/')

CREATE LOGIN data_explorer WITH PASSWORD = 'password123!';

CREATE USER data_explorer FOR LOGIN data_explorer;
GO
GRANT ADMINISTER DATABASE BULK OPERATIONS TO data_explorer;
GO

SELECT
    TOP 100 *
FROM
    OPENROWSET(
            BULK 'csv/year=2001/month=01/day_month=01/part-00000-a4a63e02-58c5-4761-84fa-7ad7f167a91a.c000.csv',
            DATA_SOURCE = 'SanFranciscoLake',
            FORMAT = 'CSV',
            PARSER_VERSION = '2.0',
            FIELDTERMINATOR = '|',
            HEADER_ROW = TRUE
        ) AS [result]