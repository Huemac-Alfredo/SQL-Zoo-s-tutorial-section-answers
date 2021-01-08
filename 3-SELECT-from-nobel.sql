-- 1. Winners from 1950
SELECT yr, subject, winner
  FROM nobel
 WHERE yr = 1950

-- 2. 1962 Literature
SELECT winner FROM nobel
 WHERE yr = 1962 AND subject = 'Literature'

-- 3. Albert Einstein
SELECT yr, subject FROM nobel
 WHERE winner LIKE 'Albert Einstein'

-- 4. Recent Peace Prizes
SELECT winner FROM nobel
  WHERE subject LIKE 'Peace' AND yr >= 2000

-- 5. Literature in the 1980's
SELECT yr, subject, winner FROM nobel
   WHERE yr >= 1980 AND yr <= 1989 AND subject = 'Literature'

-- 6. Only Presidents
SELECT * FROM nobel
 WHERE winner IN ('Theodore Roosevelt', 'Woodrow Wilson', 'Jimmy Carter', 'Barack Obama')

-- 7. John
SELECT winner FROM nobel
  WHERE winner LIKE 'John%'

-- 8. Chemistry and Physics from different years
SELECT yr, subject, winner FROM nobel
  WHERE (subject = 'Physics' AND yr = 1980 ) OR (subject = 'Chemistry' AND yr = 1984)

-- 9. Exclude Chemists and Medics
SELECT yr, subject, winner FROM nobel 
  WHERE yr = 1980 AND subject NOT IN ('Chemistry', 'Medicine');

-- 10. Early Medicine, Late Literature
SELECT yr, subject, winner FROM nobel 
  WHERE (yr < 1910 AND subject LIKE 'Medicine') OR (yr >= 2004 AND subject LIKE 'Literature')

-- 11. Umlaut
SELECT * FROM nobel
  WHERE winner = 'Peter Grünberg'

-- 12. Apostrophe
SELECT * FROM nobel
  WHERE winner = 'Eugene O''Neill'

-- 13. Apostrophe
SELECT winner, yr, subject FROM nobel
  WHERE winner LIKE 'sir%' 
  ORDER BY yr DESC

-- 14. Chemistry and Physics last
 SELECT winner, subject FROM nobel 
  WHERE yr ='1984' 
  ORDER BY subject IN ('Physics', 'Chemistry'), subject, winner

/* Quiz */ 

-- 1. Pick the code which shows the name of winner's names beginning with C and ending in n
SELECT winner FROM nobel
 WHERE winner LIKE 'C%' AND winner LIKE '%n'

-- 2. Select the code that shows how many Chemistry awards were given between 1950 and 1960
SELECT COUNT(subject) FROM nobel
 WHERE subject = 'Chemistry'
   AND yr BETWEEN 1950 and 1960

-- 3. Pick the code that shows the amount of years where no Medicine awards were given
SELECT COUNT(DISTINCT yr) FROM nobel
 WHERE yr NOT IN (SELECT DISTINCT yr FROM nobel WHERE subject = 'Medicine')

-- 4. Select the result that would be obtained from the following code:
-- Medicine -	Sir John Eccles
-- Medicine -	Sir Frank Macfarlane Burnet

-- 5. Select the code which would show the year when neither a Physics or Chemistry award was given
SELECT yr FROM nobel
 WHERE yr NOT IN(SELECT yr 
                   FROM nobel
                 WHERE subject IN ('Chemistry','Physics'))

-- 6. Select the code which shows the years when a Medicine award was given but no Peace or Literature award was
SELECT DISTINCT yr
  FROM nobel
 WHERE subject='Medicine' 
   AND yr NOT IN(SELECT yr FROM nobel 
                  WHERE subject='Literature')
   AND yr NOT IN (SELECT yr FROM nobel
                   WHERE subject='Peace')

-- 7. Pick the result that would be obtained from the following code:
-- Chemistry -	1
-- Literature -	1
-- Medicine -	2
-- Peace -	1
-- Physics -	1
