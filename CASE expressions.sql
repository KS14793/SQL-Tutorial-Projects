SELECT
    COUNT (job_id) AS number_of_jobs,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    location_category;

SELECT
    job_title_short,
    job_location,
    CASE
        WHEN job_location = 'Anywhere' THEN 'Remote'
        WHEN job_location = 'New York, NY' THEN 'Local'
        ELSE 'Onsite'
    END AS location_category
FROM
    job_postings_fact;

SELECT 
   CASE 
       WHEN (salary_year_avg BETWEEN 25000 AND 80000) THEN '3. Low'
       WHEN (salary_year_avg BETWEEN 80001 AND 120000) THEN '2. Standard'
       ELSE '1. High'
   END AS salary_range,
   COUNT (job_id)
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst' AND salary_year_avg IS NOT NULL
GROUP BY
    salary_range;

SELECT 
    salary_year_avg = NULL
FROM
    job_postings_fact
WHERE
    job_title_short = 'Data Analyst';