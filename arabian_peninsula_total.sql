SELECT
  cast(sum(population) as integer) AS population
FROM full_2020
WHERE month = '2019-06'
  AND type = 'total_population'
  AND country IN ('YEM', 'OMN', 'SAU');
