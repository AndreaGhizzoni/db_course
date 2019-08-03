SET search_path TO assignment2,public;

/*
    in the country with the highest GDP, find the percentege of people over 65.
*/

SELECT SUM(100-children-adult) AS elderly
FROM "Population" p JOIN "Economy" e ON e.country=p.country
WHERE e."GDP" = ( SELECT MAX("GDP") FROM "Economy")
GROUP BY p.country;

