\c db2016;
SET search_path TO assignment2,public;

SELECT e.country,  (("GDP"+("GDP"*military/100))/100)-("GDP"/population)  AS gdp_increment,
	    ( SELECT AVG( ((e."GDP"+(e."GDP"*e.military/100))/100)-(e."GDP"/p.population) )
          FROM "Economy" e JOIN "Population" p ON e.country=p.country
        ) AS avg	
FROM "Economy" e JOIN "Population" p ON e.country=p.country
GROUP BY e.country, p.population
HAVING e.country = (	SELECT e.country
						FROM "Economy" e JOIN "Population" p ON e.country=p.country
						GROUP BY e.country, p.population
						ORDER BY (("GDP"+("GDP"*military/100))/100)-("GDP"/population) DESC
						LIMIT 1 
				   )
OR e.country = (		SELECT e.country
						FROM "Economy" e JOIN "Population" p ON e.country=p.country
						GROUP BY e.country, p.population
						ORDER BY (("GDP"+("GDP"*military/100))/100)-("GDP"/population) ASC
						LIMIT 1 
				);




