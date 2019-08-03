CREATE TABLE location(
    zipcode INTEGER PRIMARY KEY,
    city VARCHAR(100), 
    state VARCHAR(5)
);

CREATE TABLE company(
    name VARCHAR(100) PRIMARY KEY,
    address VARCHAR(200),
    zipcode INTEGER,
    phone CHAR(12),
    website VARCHAR(300),
    general_email VARCHAR(100),
    ceo_name VARCHAR(50),
    ceo_email VARCHAR(100),

    FOREIGN KEY(zipcode) REFERENCES location
);

CREATE TABLE stock(
    symbol VARCHAR(10), 
    date DATE, -- or timestamp
    price DECIMAL,
    volume INTEGER,
    open DECIMAL,
    low DECIMAL, 
    high DECIMAL,

    PRIMARY KEY( symbol, date )
);

CREATE TABLE stock_symbols(
    company_name VARCHAR(100),
    symbol_code VARCHAR(10), -- possiamo anche diminuirlo
    date_code DATE,
    stock_company_name VARCHAR(100),
    market VARCHAR(6),

    PRIMARY KEY(company_name, symbol_code, date_code),
    FOREIGN KEY(company_name) REFERENCES company,
    FOREIGN KEY(symbol_code, date_code) REFERENCES stock
);
