--1:
select COUNT(id) AS stops FROM stops
--2:
SELECT id FROM stops
  WHERE name = 'Craiglockhart'
--3:
SELECT id, name FROM stops JOIN route ON id = route.stop 
  WHERE route.num = 4 AND route.company = 'LRT';
--4:
SELECT company, num, COUNT(*)
FROM route WHERE stop=149 OR stop=53
GROUP BY company, num
HAVING COUNT(*) = 2
--5:
SELECT a.company, a.num, a.stop, b.stop
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
WHERE a.stop=53 && b.stop = 149
--6:
SELECT a.company, a.num, stopa.name, stopb.name
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' && stopb.name = 'London Road'
--7:
SELECT DISTINCT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Haymarket' && stopb.name = 'Leith'
--8:
SELECT a.company, a.num
FROM route a JOIN route b ON
  (a.company=b.company AND a.num=b.num)
  JOIN stops stopa ON (a.stop=stopa.id)
  JOIN stops stopb ON (b.stop=stopb.id)
WHERE stopa.name='Craiglockhart' && stopb.name = 'Tollcross'
--9:
SELECT stops.name, A.company, A.num FROM route A 
  JOIN route B ON (A.company = B.company AND A.num = B.num)
  JOIN stops ON (stops.id = A.stop)
  WHERE B.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')
--10:
SELECT DISTINCT first.num, first.company, first.name, second.num, second.company
  FROM
  (SELECT stops.name, A.company, A.num FROM route A 
  JOIN route B ON (A.company = B.company AND A.num = B.num)
  JOIN stops ON (stops.id = A.stop)
  WHERE B.stop = (SELECT id FROM stops WHERE name = 'Craiglockhart')) AS first
  JOIN
  (SELECT stops.name, A.company, A.num FROM route A 
  JOIN route B ON (A.company = B.company AND A.num = B.num)
  JOIN stops ON (stops.id = A.stop)
  WHERE B.stop = (SELECT id FROM stops WHERE name = 'Sighthill')) AS second
  WHERE first.name = second.name
  