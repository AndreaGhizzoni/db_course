\c db2016;
SET search_path TO assignment2,public;

SELECT l.country
FROM "Language" l JOIN "Economy" e ON l.country=e.country
WHERE l.language='English'
GROUP BY l.country, percentage, poverty
HAVING percentage >= 50 AND poverty > ( SELECT poverty 
                                        FROM "Economy" 
                                        WHERE country='US' OR country='USA' );
