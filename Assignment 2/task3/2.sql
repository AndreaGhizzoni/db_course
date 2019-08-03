SET search_path TO assignment2,public;

SELECT language
FROM "Population" p JOIN "Language" l ON p.country=l.country
WHERE l.percentage > 50 AND p.country IN (	SELECT country
		 	           						FROM "Population"
		 		   							ORDER BY sex_ratio DESC
		 		   							LIMIT 1);
