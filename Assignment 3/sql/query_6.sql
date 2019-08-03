-- ******* 06
-- Trovare i possibili match tra aziende in `companies.csv` e aziende in 
-- `stock_symbols.csv`.
-- Un match è valido solo se i primi 5 caratteri (spazi inclusi) di 
-- `company_name` in `stock_symbols.csv` appaiono in `name` di `companies.csv`, 
-- e al contempo se la differenza nel numero di caratteri tra `company_name` 
-- e `name` (ovvero lunghezza(`company_name`) -lunghezza(`name`)) è minore 11.
-- Per ogni match valido tornare il possibile `symbol` e lo stato.

-- Restituire: company_name, name, symbol, state

-- N.b. select  left('stringa1 abcd',5) = left('stringa2 abcdefghi', 5) ;
-- http://www.postgresql.org/docs/9.3/static/functions-string.html

-- Esempio
--           company_name           |             name              | symbol  | state
-- ---------------------------------+-------------------------------+---------+-------
--  American Claims Evaluation Inc. | American Axle & Manufacturing | AMCE    | MI
--  Microsoft Corp.                 | Microsoft                     | MSFT    | WA

WITH names AS(
    SELECT DISTINCT company_name, stock_company_name, symbol_code AS symbol
    FROM stock_symbols
    WHERE left(company_name, 5) = left(stock_company_name, 5) AND
          (length(stock_company_name)-length(company_name)) < 11
)
SELECT n.company_name, n.stock_company_name AS name, n.symbol, l.state
FROM company c JOIN names n ON c.name = n.company_name
               JOIN location l ON c.zipcode = l.zipcode;

