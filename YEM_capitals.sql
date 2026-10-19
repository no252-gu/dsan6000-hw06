SELECT
  adm1,
  cast(sum(population) as integer) AS population
FROM yemen_2020
WHERE type = 'total_population'
  AND adm1 IN ('Sana''a', 'Aden')
GROUP BY adm1
ORDER BY adm1;
