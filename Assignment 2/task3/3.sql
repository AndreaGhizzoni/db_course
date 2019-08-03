SET search_path TO assignment2,public;

SELECT capital, area
FROM "Country" c JOIN "Economy" e ON c.code=e.country
GROUP BY code
ORDER BY SUM("GDP"*military/100) DESC
LIMIT 5;
