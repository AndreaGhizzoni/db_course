SET search_path TO assignment2,public;

SELECT code
FROM "Country"
ORDER BY area DESC
LIMIT 1 OFFSET 14; 

