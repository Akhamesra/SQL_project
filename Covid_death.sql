SELECT *
FROM Deaths


SELECT *
FROM Vaccine;

-- Check Data types
SELECT COLUMN_NAME,
       DATA_TYPE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME='Deaths';


--1
SELECT SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_cases, SUM(cast(new_deaths as int))/SUM(new_cases) *100 as death_percentage
FROM Deaths
WHERE continent is not null


--2
SELECT location, SUM(cast(new_deaths as int)) as total_death_count
FROM Deaths
WHERE continent is null AND location not in ('World', 'European Union', 'International')
GROUP BY location
ORDER BY total_death_count DESC


--3
SELECT location, population, MAX(total_cases) as highest_cases, MAX(total_cases/population)*100 as percent_population_infected
FROM Deaths
GROUP BY location, population
ORDER BY percent_population_infected DESC

--4
Select location, Population,date, MAX(total_cases) as highest_cases,  Max(total_cases/population)*100 as percent_population_infected
From Deaths
Group by Location, Population, date
order by percent_population_infected desc