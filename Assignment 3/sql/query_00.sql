
-- [query_00] Ricostruire i file .csv
-- utilizzati in input ordinandoli su date , market e name
-- ( a seconda dei campi contenuti) e salvati nella cartella /tmp/output .
--
-- in particolare, ordinare solo i file:
-- `companies.csv` su `name`
-- `stock_symbols.csv` su `market` e `company_name`
-- `stock_price.csv` su `date` e `symbol`
--
-- Il risultato può essere verificato col comando da terminale
-- diff --brief <( sort file_originale.csv ) <(sort risultato_query.csv)

-- Esempio di struttura della query per `companies.csv`
-- COPY( SELECT [...] )
-- TO '/tmp/output/companies.csv`'
-- WITH [...];

COPY( SELECT c.name, c.address, l.city, l.state, l.zipcode, c.phone, c.website,
             c.general_email, c.ceo_name, c.ceo_email
      FROM company c JOIN location l ON c.zipcode=l.zipcode
      ORDER BY c.name )
TO '/tmp/output/companies.csv'
WITH DELIMITER ';' CSV
NULL AS 'None';

COPY( SELECT symbol, date, price, volume, open, low, high
      FROM stock
      ORDER BY (date, symbol) )
TO '/tmp/output/stock_price.csv'
WITH DELIMITER ',' CSV;

COPY( SELECT DISTINCT * FROM (
        SELECT market, stock_company_name, symbol_code 
        FROM stock_symbols 
        ORDER BY( market, stock_company_name ) ) AS ex )
TO '/tmp/output/stock_symbols.csv'
WITH DELIMITER ',' CSV QUOTE AS '"' FORCE QUOTE stock_company_name;


