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

-- write a query to return the number of countries with a population smalelr than 150000
SELECT COUNT("id") FROM "bbc" WHERE "population" < 150000;

-- write a query to return all regions that have area greater than 15000000; return the region and its total area. 
SELECT * FROM (SELECT "region", SUM("area") AS "total_area" FROM "bbc" GROUP BY "region") AS "result" WHERE "total_area" > 15000000;

-- write a query to return the average population of poland, germany and denmark 
SELECT AVG("population") FROM "bbc" WHERE "name" IN ('Poland', 'Germany', 'Denmark');

-- write a query to return the medium population density of each region 
SELECT "region", SUM("population")/SUM("area") AS "pop_density" FROM "bbc" GROUP BY "region";

-- write a query to return the name and population density of the country with the largest population;
SELECT "name", "population"/"area" AS "pop_density" FROM "bbc" WHERE "population" = (SELECT MAX("population") FROM "bbc");

-- write a query to return all regions with minimum total area of 2000000 
SELECT "region", SUM("area") AS "total_area" FROM "bbc" GROUP BY "region" HAVING SUM(area) > 2000000;

-- write a query to return the name, region, and population of the smallest country in each region
SELECT "name", "region", "population" FROM "bbc" AS "R" WHERE "population" = (SELECT MIN("population") FROM "bbc" WHERE "region" = "R"."region");

-- write a query to return the countries belonging to regions wherein all countries have population over 50000
SELECT "name" FROM "bbc" WHERE "region" = (SELECT "region" FROM "bbc" WHERE SUM("population") > 50000);

-- write a query to return the countries with a less than a third of the population of the countries around it 
SELECT "name" FROM "bbc" AS "R" WHERE "population" < (SELECT SUM("population") * 0.3 FROM "bbc" WHERE "region" = "R"."region" AND "name" != "R"."name");

-- write a query to return countries that have a bigger population than the UK and are in Europe.
SELECT "name" FROM "bbc" WHERE "region" = (SELECT "region" FROM "bbc" WHERE "name" = 'United Kingdom') AND "population" > (SELECT "population" FROM "bbc" WHERE "name" = 'United Kingdom'); 

-- write a query to return the countries with greater GDP than any country in Africa. 
SELECT "name" FROM "bbc" WHERE "gdp" > (SELECT MAX("gdp") FROM "bbc" WHERE "region" = 'Africa');

-- write a query to return countries with population smaller than Russia but bigger than Denmark. 
SELECT "name" FROM "bbc" WHERE "population" < (SELECT "population" FROM "bbc" WHERE "name" = 'Russia') AND "population" > (SELECT "population" FROM "bbc" WHERE "name" = 'Denmark');

-- write a query to return countries that have bigger population than all countries within Europe. 
SELECT "name" FROM "bbc" WHERE "population" > (SELECT MAX("population") FROM "bbc" WHERE "region" = 'Europe');

-- write a query to find the stadium where player 'Dimitris Salpingidis' scored.
SELECT "stadium" FROM "game" JOIN "goal" ON "game"."id" = "goal"."matchid" WHERE "player" = 'Dimitris Salpingidis';

-- write a query to join goal and eteam tables together. 
SELECT "goal"."id", "teamname", "coach", "teamid", "matchid", "player", "gtime" FROM "eteam" JOIN "goal" ON "eteam"."id" = "goal"."teamid";

-- write a query that shows which players, their team and the amount of goals they scored against greece. 
SELECT "player", "teamname", COUNT("player") AS "goals" FROM "goal" 
JOIN "game" ON "goal"."matchid" = "game"."id" 
JOIN "eteam" ON "eteam"."id" = "goal"."teamid" 
WHERE ("game"."team1" = 4 OR "game"."team2" = 4) AND "goal"."teamid" != 4 GROUP BY "goal"."player", "eteam"."teamname";

-- write a query to return the goals taht were scored on 9 june 2012. return the teams that scored them and the match date. 
SELECT "teamname", "mdate" FROM "goal"
JOIN "game" ON ("goal"."matchid" = "game"."id") 
JOIN "eteam" ON ("goal"."teamid" = "eteam"."id")
WHERE "game"."mdate" = '9 June 2012';

-- write a query to return the players and their team who scored against poland in national stadium, warsaw. 
SELECT * FROM "goal" JOIN "game" on "game"."id" = "goal"."matchid" 
JOIN "eteam" ON "eteam"."id" = "goal"."teamid" WHERE "goal"."teamid" = "game"."team1" OR "goal"."teamid" = "game"."team2"

-- write a query to return the players, their team and the time they scored in Stadion Miejski but not against Italy. 

-- write a query to return the teams that scored less than 3 goals.