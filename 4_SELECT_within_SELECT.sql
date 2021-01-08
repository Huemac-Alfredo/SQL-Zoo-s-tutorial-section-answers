-- 1. List each country name where the population is larger than that of 'Russia'.
SELECT name FROM world WHERE population >
  (SELECT population FROM world WHERE name='Russia');

-- 2. Richer than UK
SELECT name FROM world WHERE continent = 'Europe' and gdp/population > 
  (SELECT gdp/population FROM world WHERE name = 'United Kingdom');

-- 3. Neighbours of Argentina and Australia
SELECT name, continent FROM world WHERE continent in 
  (SELECT continent FROM world WHERE name in ('Argentina', 'Australia')) 
    ORDER BY name;

-- 4. Between Canada and Poland
SELECT name, population FROM world WHERE population > 
  (SELECT population FROM world WHERE name = 'Canada') 
    and population < (SELECT population FROM world WHERE name = 'Poland');

-- 5. Percentages of Germany
SELECT name, CONCAT(ROUND((population*100)/(SELECT population FROM world WHERE name = 'Germany')), '%') AS percentage
FROM world
  WHERE continent = 'Europe'

-- 6. Bigger than every country in Europe
SELECT name FROM world
  WHERE gdp > (SELECT MAX(gdp) FROM world
                 WHERE continent = 'Europe')

-- 7. Largest in each continent
SELECT continent, name, area FROM world x
  WHERE area >= ALL
    (SELECT area FROM world y
        WHERE y.continent=x.continent
          AND area>0)

-- 8. First country of each continent (alphabetically)
SELECT continent, MIN(name) AS name FROM world
  GROUP BY continent

-- 9. Difficult Questions That Utilize Techniques Not Covered In Prior Sections
SELECT name, continent, population
  FROM world a
 WHERE 25000000 >= ALL (SELECT population FROM world z
                          WHERE a.continent=z.continent
                          AND z.population>0)

-- 10. 
SELECT name, continent
  FROM world a
  WHERE population >= ALL (SELECT population*3
                            FROM world z
                            WHERE a.continent = z.continent
                            AND z.name!= a.name)