-- 1. 1962 movies
SELECT id, title
 FROM movie
 WHERE yr=1962

-- 2. When was Citizen Kane released?
SELECT yr FROM movie
  WHERE title = 'Citizen Kane'

-- 3. Star Trek movies
SELECT id, title, yr FROM movie
  WHERE title LIKE('%Star Trek%')
  ORDER BY yr

-- 4. id for actor Glenn Close
SELECT id FROM actor
  WHERE name = 'Glenn Close'

-- 5. id for Casablanca
SELECT id FROM movie
  WHERE title = 'Casablanca'

-- 6. Cast list for Casablanca
SELECT name FROM actor JOIN casting ON actor.id=actorid 
  WHERE movieid = 11768

-- 7. Alien cast list
SELECT name 
  FROM movie JOIN actor JOIN casting ON actor.id=actorid AND movie.id=movieid
  WHERE title = 'Alien'

-- 8. Harrison Ford movies
SELECT title 
  FROM movie JOIN actor JOIN casting ON actor.id=actorid AND movie.id=movieid
  WHERE name = 'Harrison Ford'

-- 9. Harrison Ford as a supporting actor
SELECT title 
  FROM movie JOIN actor JOIN casting ON actor.id=actorid AND movie.id=movieid
  WHERE name = 'Harrison Ford' AND ord != 1

-- 10. Lead actors in 1962 movies
SELECT title, name
  FROM movie JOIN actor JOIN casting ON actor.id=actorid AND movie.id=movieid
  WHERE yr = 1962 AND ord = 1

-- 11. Busy years for Rock Hudson
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
        JOIN actor   ON actorid=actor.id
WHERE name='Rock Hudson'
GROUP BY yr
HAVING COUNT(title) > 2

-- 12. Lead actor in Julie Andrews movies
SELECT title, name
  FROM movie JOIN casting ON movieid=movie.id AND ord=1
             JOIN actor ON actorid=actor.id
  WHERE movie.id IN (SELECT movieid FROM casting
                       WHERE actorid IN (SELECT id FROM actor
                                           WHERE name='Julie Andrews'))

-- 13. Actors with 15 leading roles
SELECT a.name
FROM casting c
JOIN actor a ON a.id = c.actorid
WHERE c.ord = 1
GROUP BY 1
HAVING COUNT(*) >= 15;

-- 14.
SELECT title, COUNT(movieid) FROM casting JOIN movie m ON movieid = m.id WHERE yr = 1978 
  GROUP BY title ORDER BY COUNT(movieid) DESC, title;

-- 15.
SELECT name
FROM actor JOIN casting ON actor.id = casting.actorid
WHERE movieid IN (10095, 11434, 13630)
  AND
  casting.actorid != 1112;

/* JOIN QUIZ 2 */

-- 1. 
SELECT name
  FROM actor INNER JOIN movie ON actor.id = director
  WHERE gross < budget

-- 2.
SELECT *
  FROM actor JOIN casting ON actor.id = actorid
  JOIN movie ON movie.id = movieid

-- 3.
SELECT name, COUNT(movieid)
  FROM casting JOIN actor
 WHERE name LIKE 'John %'
 GROUP BY name ORDER BY COUNT(movieid) DESC

-- 4.
--    Table-B
-- "Crocodile" Dundee
-- Crocodile Dundee in Los Angeles
-- Flipper
-- Lightning Jack

-- 5.
SELECT name
  FROM movie JOIN casting ON movie.id = movieid
  JOIN actor ON actor.id = actorid
WHERE ord = 1 AND director = 351

-- 6.
/* link the director column in movies with the primary key in actor */
/* connect the primary keys of movie and actor via the casting table */

-- 7.
--      Table-B
-- A Bronx Tale - 1993
-- Bang the Drum Slowly	- 1973
-- Limitless - 2011
