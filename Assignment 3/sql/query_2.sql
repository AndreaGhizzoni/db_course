-- ******* 02
-- Per ogni data in `dates.csv` con codice `MN` restituire la differenza 
-- `(totale - scelto)` tra il numero di azioni (`volume`) totali sommando 
-- i due mercati (NYSE, NASDAQ) e il numero di azioni totali nel mercato 
-- scelto (in `market.csv`).
-- Restituire date, market, d_volume

-- N.b. http://www.postgresql.org/docs/9.3/static/functions-datetime.html
-- select EXTRACT(year FROM date) from dates;

-- Esempio
--     date    | market |  d_volume
-- ------------+--------+------------
--  2001-11-27 | NYSE   | 1573057000
--  2001-12-21 | NYSE   | 1658945900

SELECT s.date
FROM stock s JOIN stock_symbols sym ON s.symbol = sym.symbol_code AND
                                       s.date = sym.date_code
WHERE s.type = 'MN'
GROUP BY s.date;
