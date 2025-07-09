WITH top_paying_jobs AS (
    SELECT	
        job_id,
        job_title,
        job_location,
        salary_year_avg,
        salary_hour_avg,
        company_dim.name
    FROM
        job_postings_fact
        LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
    WHERE
            job_title_short = 'Data Analyst' 
        AND job_location LIKE '%Poland%'
        AND (salary_year_avg IS NOT NULL or salary_hour_avg IS NOT NULL)
)
SELECT 
    top_paying_jobs.*,
    skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY salary_year_avg DESC


/*
This suggests that strong foundational skills in data querying (SQL), 
data manipulation and analysis (Excel, Python), and data visualization 
(Tableau, Power BI, Looker) are highly sought after. Additionally, 
cloud platforms (GCP), big data processing (Spark), and workflow automation (Airflow) are also significant.
*/