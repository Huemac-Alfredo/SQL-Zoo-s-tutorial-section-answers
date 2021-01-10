-- 1.
SELECT COUNT(*) FROM stops

-- 2.
SELECT id FROM stops
 WHERE name = 'Craiglockhart'

-- 3.
SELECT id, name FROM stops
  JOIN route ON id = stop
 WHERE num = '4' AND company = 'LRT' 

-- 4.
SELECT company, num, COUNT(*) FROM route
  WHERE stop=149 OR stop=53
 GROUP BY company, num HAVING COUNT(*) = 2;

-- 5.
SELECT a.company, a.num, a.stop, b.stop
 FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
 WHERE a.stop=53 AND b.stop = 149;

-- 6.
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name='London Road'

-- 7.
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' AND stopb.name='Leith'

-- 8.
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND stopb.name ='Tollcross'
GROUP BY a.company, a.num;

-- 9.
SELECT stopb.name, a.company, a.num
FROM route a 
JOIN route b ON (a.company=b.company AND a.num=b.num)
JOIN stops stopa ON (a.stop=stopa.id)
JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' AND a.company = 'LRT'

-- 10.
SELECT first.num, first.company, first.name, second.num, second.company
  FROM (SELECT a.company, a.num, stopb.id AS intermediate, stopb.name
             FROM route AS a JOIN route AS b ON
                (a.company=b.company AND a.num=b.num)
              JOIN stops AS stopa ON (a.stop = stopa.id)
              JOIN stops AS stopb ON (b.stop = stopb.id)
            WHERE stopa.name = 'Craiglockhart') AS first
  JOIN (SELECT c.company, c.num, c.stop AS intermediate
             FROM route AS c JOIN route AS d ON
               (c.company=d.company AND c.num=d.num)
              JOIN stops AS stopd ON (d.stop = stopd.id)
            WHERE stopd.name = 'Lochend') AS second
   ON (first.intermediate = second.intermediate)
ORDER BY first.num, first.name, second.num;

/* SELF JOIN QUIZ */

-- 1.
SELECT DISTINCT a.name, b.name
  FROM stops a JOIN route z ON a.id=z.stop
  JOIN route y ON y.num = z.num
  JOIN stops b ON y.stop=b.id
 WHERE a.name='Craiglockhart' AND b.name ='Haymarket'

-- 2.
SELECT S2.id, S2.name, R2.company, R2.num
  FROM stops S1, stops S2, route R1, route R2
 WHERE S1.name='Haymarket' AND S1.id=R1.stop
   AND R1.company=R2.company AND R1.num=R2.num
   AND R2.stop=S2.id AND R2.num='2A'

-- 3.
SELECT a.company, a.num, stopa.name, stopb.name
  FROM route a JOIN route b ON (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
 WHERE stopa.name='Tollcross'
