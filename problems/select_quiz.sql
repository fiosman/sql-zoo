-- Write query which produces the below table
-- name	population
-- Bahrain	1234571
-- Swaziland	1220000
-- Timor-Leste	1066409

SELECT "name", "population" FROM "world" WHERE "population" BETWEEN 1000000 AND 1250000;

-- write query that fetches all records that match start with "Al". 
-- Return the name and population columns.

SELECT "name", "population" FROM "world" WHERE "name" LIKE 'Al%';