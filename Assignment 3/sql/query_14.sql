-- ******* 14
-- Per ogni data in `dates.csv` con codice `MN` trovare tra le aziende in 
-- `symbols.csv` quella con il valore totale minimo, ovvero il prodotto 
-- tra il prezzo ufficiale (`price`) e il numero di azioni (`volume`) in 
-- quella data.

-- Restituire: date, symbol, company_name, value

-- Esempio
--     date    | symbol  |          company_name           |  value
-- ------------+---------+---------------------------------+---------
--  2001-11-27 | AMCE    | American Claims Evaluation Inc. | 474.000
--  2001-12-21 | MBLA    | National Mercantile Bancorp     |   0.000
--  2001-12-21 | AMCE    | American Claims Evaluation Inc. |   0.000

WITH t AS(
    SELECT s.date_code AS date,
           s.stock_company_name AS company_name,
           s.symbol_code AS symbol,
           MIN(st.price*st.volume) AS value
    FROM stock_symbols s JOIN ( SELECT date 
                                FROM date_constraint dc
                                WHERE dc.type = 'MN' ) AS d
                              ON s.date_code = d.date,
         stock st
    WHERE s.symbol_code IN ( SELECT * FROM symbols_constraint ) AND
          st.symbol = s.symbol_code AND st.date = s.date_code
    GROUP BY s.date_code, s.stock_company_name, s.symbol_code
    ORDER BY s.date_code
)
SELECT *
FROM t
WHERE t.value = (
    SELECT MIN(s.price*s.volume)
    FROM stock s
    WHERE s.date = t.date
);

