-- write a query that returns the records with 
-- winners beginning with 'C' and ending in 'n'. 

SELECT "winner" FROM "nobel" where "winner" LIKE 'C%' AND "winner" LIKE '%n';
