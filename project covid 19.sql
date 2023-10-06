SELECT * FROM corona.`covid csv`;

-- highest number of cases in which location  1
SELECT location, total_cases from corona.`covid csv`;


-- countries with higher death rate   2
SELECT iso_code, location, avg(total_deaths) as avg_deaths
from corona.`covid csv`
where iso_code not like "OWID%"
group by iso_code, location
order by avg_deaths desc;

--- new covid cases   3
select iso_code, new_cases FROM `project new`.`covid csv`;

-- new covid cases per million per day  4
select iso_code, new_cases_per_million FROM `project new`.`covid csv`;


-- average number of covid cases per day in afghanistan  5
select avg(new_cases) as avg_new_cases
from corona.`covid csv`
where location = 'afghanistan';


-- dates and covid cases for France  6
select date, total_cases
FROM `project new`.`covid csv`
where location = 'France'
order by total_cases desc
limit 100;


-- covid cases in Canada between 01-06-2022 and 01-07-2022  7
select date, total_cases, total_deaths, people_vaccinated
FROM `project new`.`covid csv`
where location = 'Canada'
and date between '01-06-2022' and '01-06-2022';

-- total number of boosters doses   8
select location, sum(total_boosters) as recovered
FROM `project new`.`covid csv`
group by location;


-- the average number of deaths per day   9
select avg(total_deaths) as avg_death
FROM `project new`.`covid csv`;





set @startdate := (select 'date' from casualties_n_cases order by 'date' limit 1);
set @enddate := (select 'date' from causualities_n_cases order by 'date' DESC limit 1);



