SET search_path TO assignment2,public;

/*
SELECT p.country, (100-children-adult) AS elderly
FROM "Population" p JOIN "Economy" e ON e.country=p.country
WHERE (GDP/population) >= ( SELECT MAX(GDP/population)
                            FROM "Population" p JOIN "Economy" e 
                            ON e.country=p.country )
GROUP BY p.country
ORDER BY elderly DESC;
*/
