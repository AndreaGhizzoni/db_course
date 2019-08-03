\c db2016;
SET search_path TO assignment2,public;

SELECT country
FROM "Economy"
WHERE country LIKE 'C%' AND "GDP" = ( SELECT "GDP"
                                      FROM "Economy"
                                      WHERE country LIKE 'C%'
                                      ORDER BY "GDP" DESC LIMIT 1 );


