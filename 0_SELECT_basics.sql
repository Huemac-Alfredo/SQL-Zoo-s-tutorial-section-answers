-- 1. Modify it to show the population of Germany
SELECT population FROM world
  WHERE name = 'Germany'

-- 2. Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
SELECT name, population FROM world
  WHERE name IN ('Sweden', 'Norway', 'Denmark');

-- 3.
SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000

/* Quiz */ 

-- 1. Select the code which produces this table
SELECT name, population
  FROM world
 WHERE population BETWEEN 1000000 AND 1250000

-- 2. Pick the result you would obtain from this code:
/* Tamble-E */

-- 3. Select the code which shows the countries that end in A or L
SELECT name FROM world
 WHERE name LIKE '%a' OR name LIKE '%l'

-- 4. Pick the result from the query
/* Third Option */ 

-- 5. Here are the first few rows of the world table: Pick the result you would obtain from this code: SELECT name, area*2 FROM world WHERE population = 64000
/* Andorra - 936 */ 

-- 6. Select the code that would show the countries with an area larger than 50000 and a population smaller than 10000000
SELECT name, area, population
  FROM world
 WHERE area > 50000 AND population < 10000000

-- 7. Select the code that shows the population density of China, Australia, Nigeria and France
SELECT name, population/area
  FROM world
 WHERE name IN ('China', 'Nigeria', 'France', 'Australia')

