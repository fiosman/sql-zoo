-- Write query which produces the below table
-- name	population
-- Bahrain	1234571
-- Swaziland	1220000
-- Timor-Leste	1066409

SELECT "name", "population" FROM "world" WHERE "population" BETWEEN 1000000 AND 1250000;

-- write query that fetches all records that match start with "Al". 
-- Return the name and population columns.

SELECT "name", "population" FROM "world" WHERE "name" LIKE 'Al%';

-- write query to show which countries end in 'A' or 'L'
-- return the column only.

SELECT "name" FROM "world" WHERE "name" LIKE '%a' OR "name" LIKE '%l';

-- write a query to show countries with an area larger than 50000 
-- and a population less than 10000000. Return the name, area and popualation.

SELECT "name", "area", "population" FROM "world" WHERE 'area' > 50000 AND 'population' < 10000000;

-- write a query to show the population density of China, Australia, Nigeria and France 

SELECT "name", "population"/"area" AS "population_density" WHERE "name" IN('China', 'Australia', 'Nigeria', 'France');