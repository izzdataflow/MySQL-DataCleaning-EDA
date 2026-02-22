-- Exploratory Data Analysis with CTEs

SELECT * 
FROM layoffs_staging2;

-- Company with most laid off based on year 2020-2023 (top 5)
WITH Company_Year (company, years, total_laid_off) AS
(
SELECT company, YEAR(`date`), SUM(total_laid_off)
FROM layoffs_staging2
GROUP BY company, YEAR(`date`)
), Company_Year_Rank AS
(
SELECT * ,
DENSE_RANK() OVER(PARTITION BY years ORDER BY total_laid_off DESC) AS Ranking
FROM Company_Year
WHERE years IS NOT NULL
)
SELECT *
FROM Company_Year_Rank
WHERE Ranking <= 5
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

-- Industry with most laid off based on year 2020-2023 (top 5)
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
WHERE Ranking <= 5
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

-- Country with most laid off based on year 2020-2023 (top 5)
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
WHERE Ranking <= 5
AND years IS NOT NULL
ORDER BY years ASC, total_laid_off DESC;

