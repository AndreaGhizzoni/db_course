\c db2016;
SET search_path TO assignment2,public;

SELECT language, (
                    ( SUM( (population/100)*percentage ) * 100 ) / 
                    ( SELECT SUM(population) FROM "Population") 
                 ) AS world_pop_perc
FROM "Language" l JOIN "Population" p ON l.country=p.country
GROUP BY language;
