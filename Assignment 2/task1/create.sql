SET search_path TO assignment2,public;

CREATE TABLE "Country"(
    code VARCHAR(10) PRIMARY KEY,
    name VARCHAR(50),
    capital VARCHAR(50),
    area INTEGER
);

CREATE TABLE "Population"(
    country VARCHAR(10) PRIMARY KEY,
    population INTEGER,
    children INTEGER,
    adult INTEGER,
    birth_rate INTEGER,
    death_rate INTEGER,
    sex_ratio INTEGER,

    FOREIGN KEY( country ) REFERENCES "Country"
    ON DELETE SET DEFAULT
    ON UPDATE CASCADE 
);

CREATE TABLE "Economy"(
    country VARCHAR(10) PRIMARY KEY,
    "GDP" INTEGER,
    inflation INTEGER,
    military INTEGER,
    poverty INTEGER,

    FOREIGN KEY( country ) REFERENCES "Country"
    ON DELETE SET DEFAULT
    ON UPDATE CASCADE 
);

CREATE TABLE "Language"(
    country VARCHAR(10),
    language VARCHAR(30),
    percentage INTEGER,

    PRIMARY KEY( country, language ),
    FOREIGN KEY( country ) REFERENCES "Country"
    ON DELETE SET DEFAULT
    ON UPDATE CASCADE
);

