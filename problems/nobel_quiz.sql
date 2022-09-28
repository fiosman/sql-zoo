-- write a query that returns the records with 
-- winners beginning with 'C' and ending in 'n'. 

SELECT "winner" FROM "nobel" where "winner" LIKE 'C%' AND "winner" LIKE '%n';

-- write a query that returns how many chemistry awards were given 
-- between 1950 and 1960

SELECT COUNT("subject") FROM "nobel" WHERE "subject" = 'Chemistry' AND "yr" BETWEEN 1950 AND 1960; 

-- write a query that shows the amount of yrs where 
-- no medicine awards were given

SELECT COUNT("yr") FROM "nobel" WHERE "subject" != 'Medicine';

-- write a query to return winners with names starting with Sir and yr starting with 196. 

SELECT "subject", "winner" FROM "nobel" WHERE "winner" LIKE 'Sir%' AND "yr" LIKE '196%';

-- write a query that shows which year neither a phsyics or chemistry award was given. 

SELECT "yr" FROM "nobel" WHERE "subject" NOT IN ('Chemistry', 'Physics');

-- write a query that returns the years when a medicine award was given but no peace or literaure award was 

SELECT DISTINCT "yr" FROM "nobel" WHERE "subject" = 'Medicine' AND "subject" NOT IN ('Literature', 'Peace');
 
-- write a query that returns the number of each award given in the year 1960

SELECT "subject", COUNT("subject") FROM "nobel" WHERE "yr" = '1960' GROUP BY "subject"; 

-- write a query to return the sum of population of all countries in Europe 

SELECT SUM("population") AS "european_countries_pop" FROM "bbc" WHERE "region" = 'Europe';