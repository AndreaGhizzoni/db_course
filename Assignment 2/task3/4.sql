SET search_path TO assignment2,public;

-- Find the poverty rate of the country/countries with the largest number of 
-- language spoken

SELECT poverty
FROM "Language" l JOIN "Economy" e ON l.country=e.country
GROUP BY l.country, poverty
HAVING COUNT(*) >= ALL ( SELECT COUNT(*) 
                         FROM "Language"
                         GROUP BY country );





