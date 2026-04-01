-- Q1: Top counties by cases (latest date)
SELECT date, county, state, cases, deaths
FROM us_counties_daily
WHERE date = (SELECT MAX(date) FROM us_counties_daily)
ORDER BY cases DESC
LIMIT 10;

-- Q2: Top states by total cases and deaths
SELECT date, state,
       SUM(cases) AS total_cases,
       SUM(deaths) AS total_deaths
FROM us_counties_daily
WHERE date = (SELECT MAX(date) FROM us_counties_daily)
GROUP BY date, state
ORDER BY total_cases DESC
LIMIT 10;

-- Q3: National trend over time
SELECT date,
       SUM(cases) AS total_cases,
       SUM(deaths) AS total_deaths
FROM us_counties_daily
GROUP BY date
ORDER BY date;
