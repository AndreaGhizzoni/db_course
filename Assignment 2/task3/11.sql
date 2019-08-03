SET search_path TO assignment2,public;

SELECT e.country
FROM "Economy" e JOIN "Population" p ON e.country = p.country
ORDER BY poverty DESC, ("GDP"/population) DESC 
LIMIT 10;
