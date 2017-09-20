--1:
SELECT id, title
 FROM movie
 WHERE yr=1962
--2:
select yr
  from movie
  where title = 'Citizen Kane'
--3:
select id, title, yr
  from movie
  where title like '%Star Trek%'
--4:
select id 
  from actor
  where name = 'Glenn Close'
--5:
select id
  from movie
  where title = 'Casablanca'
--6:
select name 
  from casting join actor on id = actorid
  where movieid = 11768
--7:
select name 
  from casting join actor on id = actorid
  where movieid = (select id from movie where title = 'Alien')
--8:
select title
  from movie join casting on id = movieid
  where actorid = (select id from actor where name = 'Harrison Ford')
--9:
select title
  from movie join casting on id = movieid
  where actorid = (select id from actor where name = 'Harrison Ford') 
  && ord != 1
--10:
select title, name from movie 
  join casting on movie.id = movieid
  join actor on actor.id = actorid
  where yr = 1962 && ord = 1
--11:
SELECT yr,COUNT(title) FROM
  movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
where name='John Travolta'
GROUP BY yr
HAVING COUNT(title)=(SELECT MAX(c) FROM
(SELECT yr,COUNT(title) AS c FROM
   movie JOIN casting ON movie.id=movieid
         JOIN actor   ON actorid=actor.id
 where name='John Travolta'
 GROUP BY yr) AS t
)
--12:
SELECT title, name FROM movie
  JOIN casting ON movieid = movie.id AND ord = 1
  JOIN actor ON actor.id = actorid
  WHERE movie.id IN (SELECT movieid FROM casting
    WHERE actorid IN (
    SELECT id FROM actor
      WHERE name='Julie Andrews'))
--13:
SELECT DISTINCT name FROM actor
  JOIN casting ON actorid = id
  WHERE id IN (SELECT actorid FROM casting
    GROUP BY actorid, ord
    HAVING count(ord=1) >= 30)
--14:
SELECT DISTINCT title, COUNT(actorid) FROM movie
  JOIN casting ON movieid = id
  WHERE yr = 1978 AND id IN (SELECT movieid from casting
    GROUP BY movieid
    ORDER BY COUNT(actorid) DESC)
  GROUP BY title
  ORDER BY COUNT(actorid) DESC, title
--15:
SELECT DISTINCT name FROM casting
  JOIN actor on id = actorid
  WHERE movieid in (SELECT movieid FROM casting
    JOIN actor ON id = actorid
    WHERE name = 'Art Garfunkel')
  AND name != 'Art Garfunkel'
