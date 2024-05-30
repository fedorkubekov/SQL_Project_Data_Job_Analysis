/* 
Question: What are the most in-demand skills for data analysts?
- Join job postings to inner join table similar to query 2
- Identify the top 5 in-demand skills for a data analyst.
- Focus on all job postings.
- Why? To retrieve the top 5 skills with the highest demand in the job market,
    providing insights into the most valuable skills for job seekers.
*/

SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS demand_count
FROM 
    job_postings_fact
    INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
    INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND job_work_from_home = TRUE
GROUP BY 
    skills
ORDER BY
    demand_count DESC
LIMIT 5;

/*
The analysis of top demanded skills for data analyst roles in 2023 underscores the 
    importance of specific technical skills in this field. For professionals aiming 
    to secure data analyst positions, proficiency in SQL, Excel, Python, Tableau, 
    and Power BI is crucial. These skills not only enhance an individual's capability 
    to perform comprehensive data analysis but also increase their attractiveness 
    to potential employers.

RESULTS
[
  {
    "skills": "sql",
    "demand_count": "7291"
  },
  {
    "skills": "excel",
    "demand_count": "4611"
  },
  {
    "skills": "python",
    "demand_count": "4330"
  },
  {
    "skills": "tableau",
    "demand_count": "3745"
  },
  {
    "skills": "power bi",
    "demand_count": "2609"
  }
]
*/