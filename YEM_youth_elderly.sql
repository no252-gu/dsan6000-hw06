SELECT
  type,
  former_country,
  cast(sum(population) as integer) AS population
FROM (
  SELECT
    type,
    population,
    CASE
      WHEN adm1 IN ('Aden', 'Abyan', 'Al Mahrah', 'Hadramawt', 'Lahij', 'Shabwah') THEN 'PDRY'
      WHEN adm1 IN ('Al Bayda''', 'Sana''a', 'Al Dali''', 'Al Hudaydah', 'Al Jawf',
                    'Al Mahwit', 'Amanat Al Asimah', 'Amran', 'Dhamar', 'Hajjah',
                    'Ibb', 'Ma''rib', 'Raymah', 'Sa''dah', 'Ta''izz') THEN 'YAR'
    END AS former_country
  FROM yemen_2020
  WHERE type IN ('elderly_60_plus', 'youth_15_24')
)
WHERE former_country IS NOT NULL
GROUP BY type, former_country
ORDER BY type, former_country;
