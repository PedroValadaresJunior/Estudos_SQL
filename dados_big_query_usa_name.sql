SELECT * FROM `bigquery-public-data.usa_names.usa_1910_current` LIMIT 1000;

-- Contagem dos nomes mais comuns por cada Estado
SELECT DISTINCT
  state,
  name,
  COUNT(name) OVER(PARTITION BY state, name) AS contagem
FROM 
  `bigquery-public-data.usa_names.usa_1910_current`
ORDER BY 
  contagem DESC;

-- Total de pessoas por gênero
SELECT DISTINCT
  gender,
  COUNT(name) AS total_pessoas  -- F3510324 M2801180
FROM 
  `bigquery-public-data.usa_names.usa_1910_current`
GROUP BY 
  gender;



SELECT DISTINCT
  gender,
  COUNT(name) OVER(PARTITION BY gender) AS total_genero
FROM 
  `bigquery-public-data.usa_names.usa_1910_current`;



# Retorna os dados para ALASKA e NY obtidos no ano de 1921.
SELECT 
  name,
  CASE 
    WHEN state = 'AK' THEN 'ALASKA'
    WHEN state = 'NY' THEN 'NEW YORK'
    ELSE state
  END AS state_eua,
  year
FROM 
  `bigquery-public-data.usa_names.usa_1910_current`
WHERE
  state IN ('NY', 'AK')
  AND CAST(year AS STRING) = '1921'
ORDER BY
  state_eua,
  name ASC;






