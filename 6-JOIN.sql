-- 1.
SELECT matchid, player FROM goal 
  WHERE teamid LIKE 'GER'

-- 2. 
SELECT id,stadium,team1,team2
  FROM game
  WHERE id = 1012

-- 3.
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid LIKE 'GER'

-- 4.
SELECT team1, team2, player
  FROM game JOIN goal ON (id=matchid)
  WHERE player LIKE 'Mario%'

-- 5.
SELECT player, teamid, coach, gtime
  FROM goal JOIN eteam ON teamid = id
 WHERE gtime<=10

-- 6.
SELECT mdate, teamname
FROM game JOIN eteam ON team1=eteam.id
  WHERE coach = 'Fernando Santos'

-- 7.
SELECT player 
FROM game JOIN goal ON id=matchid
WHERE stadium = 'National Stadium, Warsaw'

-- 8.
SELECT DISTINCT player
  FROM game JOIN goal ON matchid = id 
    WHERE (teamid NOT LIKE 'GER') AND (team1 = 'GER' OR team2 = 'GER')

-- 9.
SELECT teamname, COUNT(teamid)
  FROM eteam JOIN goal ON id=teamid
 GROUP BY teamname

-- 10.
SELECT 
  game.stadium, COUNT(goal.player) AS NumberOfGoals
    FROM game
      JOIN goal ON game.id = goal.matchid
        GROUP BY game.stadium;

-- 11.
SELECT matchid, mdate, COUNT(*)
FROM game
JOIN goal ON matchid = id 
WHERE (team1 = 'POL' OR team2 = 'POL')
GROUP BY matchid, mdate;

-- 12.
SELECT matchid, mdate, COUNT(*)
FROM game g
JOIN goal go ON go.matchid = g.id
WHERE go.teamid = 'GER'
GROUP BY matchid, mdate;

-- 13.
SELECT mdate, team1,
  SUM(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) AS score1,
  team2,
  SUM(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) AS score2
  FROM game LEFT JOIN goal ON matchid = id GROUP BY mdate, matchid, team1, team2;

/* QUIZ */

-- 1.
 game  JOIN goal ON (id=matchid)

-- 2.
 matchid, teamid, player, gtime, id, teamname, coach

-- 3. 
SELECT player, teamid, COUNT(*)
  FROM game JOIN goal ON matchid = id
 WHERE (team1 = "GRE" OR team2 = "GRE")
   AND teamid != 'GRE'
 GROUP BY player, teamid

-- 4.
-- DEN -	9 June 2012
-- GER -	9 June 2012

-- 5.
SELECT DISTINCT player, teamid 
   FROM game JOIN goal ON matchid = id 
  WHERE stadium = 'National Stadium, Warsaw' 
 AND (team1 = 'POL' OR team2 = 'POL')
   AND teamid != 'POL'

-- 6.
SELECT DISTINCT player, teamid, gtime
  FROM game JOIN goal ON matchid = id
 WHERE stadium = 'Stadion Miejski (Wroclaw)'
   AND (( teamid = team2 AND team1 != 'ITA') OR ( teamid = team1 AND team2 != 'ITA'))

-- 7.
-- Netherlands -	2
-- Poland -	2
-- Republic of Ireland -	1
-- Ukraine -	2
