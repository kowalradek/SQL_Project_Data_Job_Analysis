/*
Answer: What are the top skills based on salary?
- Look at the average salary associated with each skill for Data Analyst positions
- Focuses on roles with specified salaries in Poland
- Why? It reveals how different skills impact salary levels for Data Analysts and 
    helps identify the most financially rewarding skills to acquire or improve
*/


SELECT 
    skills,
    round(avg(salary_year_avg), 0) AS average_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE 
    job_title_short = 'Data Analyst' AND
    job_location LIKE '%Poland%' AND
    salary_year_avg IS NOT NULL 
    
GROUP BY 
    skills
ORDER BY
    average_salary DESC
LIMIT 25;




/*
Big Data and Cloud Expertise Commands Top Salaries: 
Skills related to handling massive datasets (Hadoop, Spark, Mongo, NoSQL) 
and working with cloud platforms (AWS, Azure, BigQuery, Snowflake) are at the very top 
of the salary spectrum. This indicates a strong demand for 
analysts who can operate within modern, scalable data infrastructures.

Infrastructure and Environment Skills are Highly Valued: Proficiency in operating systems like 
Linux and Unix, and general environment knowledge, also brings a significant salary premium, 
often related to managing data pipelines and underlying systems.

Automation and Project Management are Emerging: Skills in data orchestration (Airflow) and 
project management (Jira) show that employers value analysts who can streamline processes and 
work effectively within structured project environments.

Core Analytical and Programming Skills Remain Essential, but Not Always the Highest Paid 
on Their Own: While foundational skills like Python, SQL, and traditional BI tools (Tableau, Looker) 
are crucial and frequently in demand, the highest salaries tend to go to those who combine these with 
more specialized big data, cloud, and infrastructure skills. The presence of scikit-learn suggests a 
move towards more advanced analytical and predictive modeling within data analyst roles.

Niche Programming and Version Control: Even niche programming languages like C++ and Rust, 
along with version control systems like Git, command good salaries, indicating roles where 
robust code and collaborative development practices are important.
*/