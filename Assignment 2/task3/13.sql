SET search_path TO assignment2,public;

SELECT language
FROM "Language" l JOIN "Population" p ON l.country=p.country
WHERE percentage >= 25
GROUP BY language
ORDER BY AVG( adult ) DESC;
