/*
Question: what are the top paying data jobs in Poland?
- identify the top 10 highest paying data-analyst roles 
- focuses on job postings with specified salaries (remove nulls)
- Why? highlight the top paying opportunities for Data Analysts, offering insights into employment options
*/

SELECT	
	job_id,
	job_title,
	job_location,
	job_schedule_type,
	salary_year_avg,
	job_posted_date, 
    company_dim.name
FROM
    job_postings_fact
    LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
        job_title_short = 'Data Analyst' 
    AND job_location LIKE '%Poland%'
    AND salary_year_avg IS NOT NULL
ORDER BY salary_year_avg DESC
LIMIT 10;