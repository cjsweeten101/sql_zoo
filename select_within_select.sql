--1:
SELECT name FROM world
  WHERE population >
     (SELECT population FROM world
      WHERE name='Russia')
--2:
select name from world
where gdp/population > (
  select gdp/population from world
  where name = 'United Kingdom')
and continent = 'Europe'
--3:
select name, continent from world
where continent in (select continent from world where
  name = 'Argentina' or name = 'Australia')
order by name
--4:
select name, population from world 
where population > (select population from world where name = 'Canada')
and population < (select population from world where name = 'Poland')
--5:
select name, concat(round(100*(population/(select population from world where name = 'Germany'))), '%') from world
where continent = 'Europe'