/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Scientist positions
- Focus on roles with specified salaries, regardless of location
- Why? It reveals how different skills impact salary levels for Data Analysts and
  helps identify the most financially rewarding skills to acquire or improve
*/

SELECT
    skills,
    ROUND (AVG (salary_year_avg),0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Scientist' AND
    salary_year_avg IS NOT NULL AND
    job_work_from_home = TRUE
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25

/* Here's a breakdown of the insights:
Specialized & Niche Expertise Drives Top Salaries: 
Skills like GDPR, Golang, and Solidity highlight that domain-specific 
and less common expertise commands the highest pay, 
as companies are willing to pay a premium for rare, business-critical capabilities.
Strong Overlap Between Data Science and Engineering: 
The presence of tools like Go, Rust, Airflow, Redis, and Cassandra 
indicates that top-paying roles require not just analysis, 
but also building and maintaining scalable systems, 
reflecting a shift toward hybrid data + engineering roles.
Broad Technical Versatility Across the Data Stack: 
A wide mix of BI tools (Looker, Qlik), databases (DynamoDB, Neo4j), 
programming languages, and AI platforms suggests that top-paying 
data scientist roles demand proficiency across multiple layers 
of the data ecosystem rather than a single specialization.
*/