-- Exploratory Data Analysis with CTEs

SELECT * 
FROM layoffs_staging2;

-- Industry with least laid off based on year 2020-2023 (top 5)
WITH Industry_Year (industry, years, total_laid_off) AS
(
SELECT industry, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY industry, YEAR(`date`)
), Industry_Year_Rank AS
(
SELECT * ,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Industry_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Industry_Year_Rank
WHERE Ranking > 20 AND Ranking < 27
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

-- Country with least laid off based on year 2020-2023 (top 5)
WITH Country_Year (country, years, total_laid_off) AS
(
SELECT country, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY country, YEAR(`date`)
), Country_Year_Rank AS
(
SELECT * ,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Country_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Country_Year_Rank
WHERE Ranking > 17 AND Ranking < 27
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

-- Location with least laid off based on year 2020-2023 (top 5)
WITH Location_Year (location, years, total_laid_off) AS
(
SELECT location, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY location, YEAR(`date`)
), Location_Year_Rank AS
(
SELECT * ,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Location_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Location_Year_Rank
WHERE Ranking > 20 AND Ranking < 27
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;