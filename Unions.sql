--UNIONS

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

--UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    january_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    february_jobs

UNION ALL

SELECT
    job_title_short,
    company_id,
    job_location
FROM
    march_jobs

--Practice Problem

SELECT
    Q1_jobs.job_title_short,
    Q1_jobs.job_location,
    Q1_jobs.job_via,
    Q1_jobs.job_posted_date :: DATE,
    Q1_jobs.salary_year_avg
FROM (
    SELECT *
    FROM january_jobs
    UNION ALL
    SELECT *
    FROM february_jobs
    UNION ALL
    SELECT *
    FROM march_jobs
) AS Q1_jobs
WHERE Q1_jobs.salary_year_avg > 70000 AND
      Q1_jobs.job_title_short = 'Data Analyst'
ORDER BY
    Q1_jobs.salary_year_avg DESC