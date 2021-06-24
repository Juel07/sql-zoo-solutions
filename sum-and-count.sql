--  Sum and Count
    -- An aggregate function takes many values and delivers just one value. For example the function SUM would aggregate the values 2, 4 and 5 to deliver the single value 11.
    -- By default the result of a SELECT may contain duplicate rows. We can remove these duplicates using the DISTINCT key word.
    -- ORDER BY permits us to see the result of a SELECT in any particular order. We may indicate ASC or DESC for ascending (smallest first, largest last) or descending order.
    -- The functions SUM, COUNT, MAX and AVG are "aggregates", each may be applied to a numeric attribute resulting in a single row being returned by the query.

-- world(name, continent, area, population, gdp)

-- 1. Show the total population of the world.
SELECT SUM(population)
FROM world

-- 2. List all the continents - just once each.
SELECT DISTINCT continent
FROM world

-- 3. Give the total GDP of Africa
SELECT SUM(gdp)
FROM world
WHERE continent = 'Africa'

-- 4. How many countries have an area of at least 1000000
SELECT COUNT(name)
FROM world
WHERE area >= 1000000

-- 5. What is the total population of ('Estonia', 'Latvia', 'Lithuania')
SELECT sum(population)
FROM world
WHERE name IN ('Estonia', 'Latvia', 'Lithuania')

-- 6. For each continent show the continent and number of countries.
SELECT continent, COUNT(name)
FROM world
GROUP BY continent

-- 7. For each continent show the continent and number of countries with populations of at least 10 million
SELECT continent, COUNT(name)
FROM world
WHERE population > 10000000
GROUP BY continent

-- 8. List the continents that have a total population of at least 100 million.
SELECT continent
FROM world
GROUP BY continent
HAVING SUM(population) >= 100000000

-- 
-- Quiz

-- 1 (c)
-- 2 (a)
-- 3 (d)
-- 4 (e)
-- 5 (b)
-- 6 (e)
-- 7. Select the statement that shows the name and population density of the country with the largest population (d)
SELECT name, population/area AS density 
FROM bbc 
WHERE population = (SELECT MAX(population) FROM bbc)
-- 8 (d)
