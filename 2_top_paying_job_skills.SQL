/*

Main question to answer: what are the skills required for the top paying data analyst job?
> building upon "1_top_paying_jobs" query
> Add the specific skills required for these roles

Rationale: Why? It provides a detailed look at which high-paying jobs demand what specific skills,
helping job seekers understand which skills to develop that align with top salaries

*/

WITH top_paying_jobs_company AS(
    SELECT 
        job_id,
        job_title,
        company_dim.name AS company_name,
        salary_year_avg
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
)


SELECT 
    top_paying_jobs_company.*,
    skills_dim.skills
FROM top_paying_jobs_company
INNER JOIN skills_job_dim ON top_paying_jobs_company.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg
-- Can use these lines of code for visualisation at this point

/*

Summary breakdown of the most demanded skills for data analysts in 2023, based on job postings:
> SQL is leading with a bold count of 8.
> Python follows closely with a bold count of 7.
> Tableau is also highly sought after, with a bold count of 6.
> Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.

/*