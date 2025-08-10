/*

Main question to answer: what are the top paying data analyst job?
- Identify top 10 highest paying data analyst roles that are available remotely 
- Focuses on job postings with specified salaries (remove nulls).

Rationale: Highlight the top-paying opportunities for Data Analysts, 
offering insights into employment opportunities

*/


SELECT 
    job_id,
    job_title,
    company_dim.name AS company_name,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date
    
FROM
    job_postings_fact

 -- only want rows whose companies have job postings
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id

WHERE
    salary_year_avg IS NOT NULL
    AND job_title_short = 'Data Analyst'
    AND job_location = 'Anywhere'

ORDER BY 
    salary_year_avg DESC

LIMIT 10

