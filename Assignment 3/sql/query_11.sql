-- ******* 11
-- Per ogni mercato (NYSE, NASDAQ), per ogni anno restituire la differenza 
-- (massimo-medio) tra il massimo e il medio prezzo ufficiale (`price`),
-- e il massimo e il medio numero di azioni (`volume`)
-- Restituire market, year, d_price, d_volume

-- N.b. http://www.postgresql.org/docs/9.3/static/functions-datetime.html
-- select EXTRACT(year FROM date) from dates;

-- Esempio
--  market | year |       d_price        |        d_volume
-- --------+------+----------------------+------------------------
--  NASDAQ | 2001 | 410.5847028427922732 | 123466105.030004818292
--  NYSE   | 2001 | 497.2183607611990569 |  76338791.855843718424

SELECT sy.market, 
       EXTRACT( year FROM sy.date_code ) AS year,
       (MAX(s.high) - AVG(s.high+s.low)) AS d_price,
       (MAX(s.volume) - AVG(s.volume)) AS d_volume
FROM stock_symbols sy JOIN stock s ON sy.symbol_code = s.symbol AND
                                      sy.date_code = s.date
GROUP BY sy.market, year;

