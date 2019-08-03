-- ******* 03
-- Per ogni intervallo delimitato da una coppia di date successive 
-- (ovvero la prima data è precedente alla seconda) in `dates.csv` 
-- dove la prima data ha codice "ST" e la seconda ha codice "ED" e 
-- tra le due non appaiono date con codice "ST" o "ED", trovare tra 
-- le azioni in `symbols.csv` quelle con la minima differenza tra i 
-- suoi valori "high" nell'intervallo estremi esclusi.
-- Restituire: start, end, symbol, company_name, d_high

-- Esempio
--    start    |    end     | symbol  |        company_name         | d_high
-- ------------+------------+---------+-----------------------------+--------
--  2001-10-01 | 2001-12-01 | RMKR    | Rainmaker Systems Inc.      |  0.110
--  2001-12-01 | 2001-12-05 | FCH     | FelCor Lodging Trust        |  0.010
--  2001-12-20 | 2001-12-31 | MBLA    | National Mercantile Bancorp |  0.000

