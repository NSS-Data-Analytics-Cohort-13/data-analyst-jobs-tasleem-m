--q1 How many rows are in the data_analyst_jobs table?
SELECT COUNT (title)
FROM data_analyst_jobs

--q2 Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?
SELECT *
FROM data_analyst_jobs
LIMIT 10
--answer: ExxonMobil

--q3 How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?
SELECT location, COUNT (title) AS count_postings_TN_and_KY
FROM data_analyst_jobs
WHERE (location = 'TN' OR location = 'KY')
GROUP BY location

--q4 How many postings in Tennessee have a star rating above 4?
SELECT COUNT (title) AS count_postings_4_and_above_rating_TN
FROM data_analyst_jobs
WHERE star_rating > 4 AND location = 'TN'

--q5 How many postings in the dataset have a review count between 500 and 1000?
SELECT COUNT (title) AS count_postings_with_review_count_between_500_and_1000
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000

--q6 Which state shows the highest average rating?
SELECT location AS state, AVG(star_rating) AS avg_rating 
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC
--answer: NE

--q7 Select unique job titles from the data_analyst_jobs table. How many are there?
SELECT COUNT(DISTINCT title) AS count_distinct_title
FROM data_analyst_jobs

--q8 How many unique job titles are there for California companies?
SELECT COUNT(DISTINCT title) AS count_distinct_title_CA
FROM data_analyst_jobs
WHERE location = 'CA'

--q9 How many companies are there with more that 5000 reviews across all locations?
SELECT company, AVG (star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL AND review_count > 5000
GROUP BY company
--answer: 40

--q10 Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?
SELECT company, AVG (star_rating) AS avg_star_rating
FROM data_analyst_jobs
WHERE company IS NOT NULL AND review_count > 5000
GROUP BY company
ORDER BY avg_star_rating DESC
--answer: Unilever with avg_star_rating of 4.1999998090000000

--q11 Find all the job titles that contain the word ‘Analyst’. How many different job titles are there?

SELECT COUNT (DISTINCT title) AS count_distinct_analyst_titles
FROM data_analyst_jobs
WHERE title LIKE '%Analyst%'

--q12 How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT DISTINCT title
FROM data_analyst_jobs
WHERE (title NOT LIKE '%Analyst%' AND title NOT LIKE '%Analytics%')
AND (title NOT LIKE '%analyst%' AND title NOT LIKE '%analytics%')
AND (title NOT LIKE '%ANALYST%' AND title NOT LIKE '%ANALYTICS%')
--answer: 4; Tableau