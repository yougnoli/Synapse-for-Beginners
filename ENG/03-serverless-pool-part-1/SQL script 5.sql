SELECT
    count(*) as num_rows
FROM
    OPENROWSET(
            BULK 'csv/year=2001/month=01/day_month=01/*',
            DATA_SOURCE = 'SanFranciscoLake',
            FORMAT = 'CSV',
            PARSER_VERSION = '2.0',
            FIELDTERMINATOR = '|',
            HEADER_ROW = TRUE
        ) AS [result];

SELECT
    count(*) as num_rows
FROM
    OPENROWSET(
            BULK 'csv/year=2001/month=01/*/*',
            DATA_SOURCE = 'SanFranciscoLake',
            FORMAT = 'CSV',
            PARSER_VERSION = '2.0',
            FIELDTERMINATOR = '|',
            HEADER_ROW = TRUE
        ) AS [result];