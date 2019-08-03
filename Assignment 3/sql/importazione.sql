-- ========================== COMPANIES =======================================
-- tmp_c table that match the csv structure of file companies.csv
CREATE TEMP TABLE IF NOT EXISTS tmp_c(
    name VARCHAR(100),
    address VARCHAR(200),
    city VARCHAR(100), 
    state VARCHAR(5),
    zipcode INTEGER,
    phone CHAR(12),
    website VARCHAR(300),
    general_email VARCHAR(100),
    ceo_name VARCHAR(50),
    ceo_email VARCHAR(100)
);
COPY tmp_c
FROM '/tmp/dati/companies.csv' 
WITH NULL AS 'None' -- this solve the problem with None value
DELIMITER ';' CSV;

-- state_constraint table that match the csv structure of file states.csv
CREATE TABLE IF NOT EXISTS state_constraint(
    state VARCHAR(5) PRIMARY KEY
);
COPY state_constraint
FROM '/tmp/dati/states.csv'
DELIMITER ',' CSV;

-- populate location table
INSERT INTO location( zipcode, city, state )
    SELECT DISTINCT t.zipcode, t.city, t.state
    FROM tmp_c t;

-- populate table company
INSERT INTO company( name, address, zipcode, phone, website, general_email, 
                        ceo_name, ceo_email )
    SELECT c.name, c.address, c.zipcode, c.phone, c.website, c.general_email, 
           c.ceo_name, c.ceo_email FROM tmp_c c;



-- ========================== SYMBOLS =========================================
-- tmp_s table that match the csv structure of file stock_price.csv
CREATE TEMP TABLE IF NOT EXISTS tmp_s(
    symbol VARCHAR(10),
    date DATE,
    price DECIMAL,
    volume INTEGER,
    open DECIMAL,
    low DECIMAL,
    high DECIMAL
);
COPY tmp_s
FROM '/tmp/dati/stock_price.csv' 
DELIMITER ',' CSV;

-- dates_constraint table that match the csv structure of file date.csv
CREATE TABLE IF NOT EXISTS date_constraint(
    date DATE,
    type CHAR(2),
    PRIMARY KEY( date, type )
);
COPY date_constraint
FROM '/tmp/dati/dates.csv'
DELIMITER ',' CSV;

-- populate stock table
INSERT INTO stock( symbol, date, price, volume, open, low, high )
    SELECT s.symbol, s.date, s.price, s.volume, s.open, s.low, s.high
    FROM tmp_s s;



-- ========================== STOCK SYMBOLS ====================================
-- tmp_sym table that match the csv structure of file stock symbols.csv
CREATE TEMP TABLE IF NOT EXISTS tmp_sym(
    market VARCHAR(6),
    company_name VARCHAR(100),
    symbol VARCHAR(10)
);
COPY tmp_sym
FROM '/tmp/dati/stock_symbols.csv'
DELIMITER ',' CSV;

-- delete all company_name = 'N/A' because are foreign key to company.name
DELETE FROM tmp_sym s
WHERE s.company_name LIKE 'N/A';

-- market_constraint table that match the csv structure of file market.csv
CREATE TABLE IF NOT EXISTS market_constraint(
    market VARCHAR(6) PRIMARY KEY
);
COPY market_constraint
FROM '/tmp/dati/market.csv'
DELIMITER ';' CSV;

-- symbols_constraint table that match the csv structure of file symbols.csv
CREATE TABLE IF NOT EXISTS symbols_constraint(
    symbol VARCHAR(10)
);
COPY symbols_constraint
FROM '/tmp/dati/symbols.csv'
DELIMITER ';' CSV;

-- ILIKE = case insensitive LIKE
-- populate stock symbol table
INSERT INTO stock_symbols( company_name, symbol_code, date_code, 
                           stock_company_name, market )
    SELECT c.name, t.symbol, s.date, t.company_name, t.market
    FROM tmp_sym t JOIN stock s ON t.symbol = s.symbol
                   JOIN company c ON t.company_name ILIKE '%'||c.name||'%';
               

-- ========================== DROPPING TEMP TABLE =============================
DROP TABLE tmp_c;
DROP TABLE tmp_s;
DROP TABLE tmp_sym;

