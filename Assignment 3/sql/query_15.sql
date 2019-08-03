-- ******* 15
-- Per il mercato scelto (in `market.csv`) restituire l'azienda con il periodo 
-- più corto di quotazione misurato in giorni, ovvero la differenza tra la 
-- prima e l'ultima data con cui appare in `stock_price.csv`.

-- Restituire: market, symbol, company_name, first_date, last_date, days

-- N.b. http://www.postgresql.org/docs/9.3/static/functions-datetime.html
-- select date '2001-10-01' - date '2001-09-28';

-- Esempio
--  market | symbol  |          company_name           | first_date | last_date  | days
-- --------+---------+---------------------------------+------------+------------+------
--  NYSE   | KFS     | Kingsway Financial Services Inc | 2001-12-18 | 2001-12-26 |    8

WITH tmp AS (
    SELECT market, 
           symbol_code AS symbol,
           stock_company_name AS company_name,
           MIN(date_code) AS first_date,
           MAX(date_code) AS last_date,
           (MAX(date_code) - MIN(date_code)) AS days
    FROM stock_symbols
    WHERE market IN (SELECT * FROM market_constraint)
    GROUP BY stock_company_name, symbol_code, market
)
SELECT *
FROM tmp
WHERE tmp.days = ( SELECT DISTINCT MIN(days) FROM tmp );
