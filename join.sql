--1:
SELECT matchid, player FROM goal 
  WHERE teamid = 'GER'
--2:
SELECT id,stadium,team1,team2
  FROM game
  where id = 1012
--3:
SELECT player, teamid, stadium, mdate
  FROM game JOIN goal ON (id=matchid)
  WHERE teamid = 'GER'
--4:
select team1, team2, player
  from game join goal on (id=matchid)
  where player like 'Mario%'
--5:
SELECT player, teamid, coach, gtime
  FROM goal join eteam on teamid=id
  WHERE gtime <=10
--6:
select mdate, teamname
  from game join eteam on (team1 = eteam.id)
  where coach = 'Fernando Santos'
--7:
select player
  from game join goal on (id = matchid)
  where stadium = 'National Stadium, Warsaw'
--8:
SELECT distinct player
  FROM game JOIN goal ON matchid = id 
    WHERE (teamid <> 'GER' and (team1 = 'GER' or team2 = 'GER'))
  --9:
SELECT teamname, count(id)
  FROM eteam JOIN goal ON id=teamid
 group by teamname
--10:
select stadium, count(1)
  from game join goal on id=matchid
  group by stadium
--11:
SELECT matchid, mdate, count(1)
  FROM game JOIN goal ON matchid = id 
 WHERE (team1 = 'POL' OR team2 = 'POL')
 group by matchid, mdate
--12:
select matchid, mdate, count(1)
  from game join goal on id = matchid
  where (teamid = 'GER')
  group by matchid, mdate
--13:
SELECT mdate,
  team1,
  sum(CASE WHEN teamid=team1 THEN 1 ELSE 0 END) score1, team2, 
  sum(CASE WHEN teamid=team2 THEN 1 ELSE 0 END) score1
  FROM game LEFT JOIN goal ON matchid = id
  group by mdate, team1, team2
  order by mdate, matchid, team1, team2
  