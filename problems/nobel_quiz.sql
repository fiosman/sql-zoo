-- write a query that returns the records with 
-- winners beginning with 'C' and ending in 'n'. 

SELECT "winner" FROM "nobel" where "winner" LIKE 'C%' AND "winner" LIKE '%n';

-- write a query that returns how many chemistry awards were given 
-- between 1950 and 1960

SELECT COUNT("subject") FROM "nobel" WHERE "subject" = 'Chemistry' AND "yr" BETWEEN 1950 AND 1960; 

-- write a query that shows the amount of yrs where 
-- no medicine awards were given

SELECT COUNT("yr") FROM "nobel" WHERE "subject" != 'Medicine';