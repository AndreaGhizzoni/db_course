\c db2016;
SET search_path TO assignment2,public;

SELECT country
FROM "Population" 
GROUP BY country
HAVING (death_rate-birth_rate) = (SELECT (death_rate-birth_rate) AS declining
								  FROM "Population" 
								  ORDER BY declining  DESC
								  LIMIT 1);
