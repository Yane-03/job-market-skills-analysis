--How are the 30 collected job advertisements distributed across different job categories?
SELECT
    job_category,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY job_category
ORDER BY total_jobs DESC;

--What does our collected job market dataset look like?
SELECT
    COUNT(*) AS total_jobs,
    COUNT(DISTINCT company) AS total_companies,
    COUNT(DISTINCT job_category) AS total_categories,
    COUNT(DISTINCT location) AS total_locations,
    COUNT(DISTINCT country) AS total_countries
FROM job_postings;

-- RESEARCH QUESTION 4:
-- Which data-related job categories have the highest representation?

SELECT
    job_category,
    COUNT(*) AS total_jobs,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_jobs
FROM job_postings
GROUP BY job_category
ORDER BY total_jobs DESC;

-- QUERY 3: Distribution of job seniority levels
-- RESEARCH QUESTION 6: Which categories have the highest
-- proportion of entry-level opportunities?

SELECT
    seniority_level,
    COUNT(*) AS total_jobs,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_jobs
FROM job_postings
GROUP BY seniority_level
ORDER BY total_jobs DESC;

-- QUERY 4: Seniority distribution by job category

SELECT
    job_category,
    seniority_level,
    COUNT(*) AS total_jobs
FROM job_postings
GROUP BY
    job_category,
    seniority_level
ORDER BY
    job_category,
    total_jobs DESC;

-- QUERY 5: Most frequently requested required skills
-- RESEARCH QUESTION 1: Which technical skills appear most frequently?

SELECT
    s.skill_name,
    COUNT(DISTINCT js.job_id) AS number_of_jobs
FROM job_skills js
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE js.skill_type = 'Required'
GROUP BY s.skill_name
ORDER BY number_of_jobs DESC, s.skill_name
LIMIT 20;

-- QUERY 6: Most frequently preferred skills

SELECT
    s.skill_name,
    COUNT(DISTINCT js.job_id) AS number_of_jobs
FROM job_skills js
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE js.skill_type = 'Preferred'
GROUP BY s.skill_name
ORDER BY number_of_jobs DESC, s.skill_name
LIMIT 20;

-- QUERY 7: Demand for SQL, Python, Excel and Power BI
-- RESEARCH QUESTION 2

SELECT
    s.skill_name,
    js.skill_type,
    COUNT(DISTINCT js.job_id) AS number_of_jobs
FROM job_skills js
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(s.skill_name) IN (
    'sql',
    'python',
    'excel',
    'power bi'
)
GROUP BY
    s.skill_name,
    js.skill_type
ORDER BY
    s.skill_name,
    js.skill_type;

-- QUERY 8: Find all Excel-related skill names
-- RESEARCH QUESTION 2

SELECT
    s.skill_name,
    js.skill_type,
    COUNT(DISTINCT js.job_id) AS number_of_jobs
FROM skills s
JOIN job_skills js
    ON s.skill_id = js.skill_id
WHERE LOWER(s.skill_name) LIKE '%excel%'
GROUP BY
    s.skill_name,
    js.skill_type
ORDER BY
    s.skill_name,
    js.skill_type;
-- QUERY 9: Most frequently occurring skill combinations
-- RESEARCH QUESTION 3

SELECT
    s1.skill_name AS skill_1,
    s2.skill_name AS skill_2,
    COUNT(DISTINCT js1.job_id) AS jobs_with_both_skills
FROM job_skills js1
JOIN job_skills js2
    ON js1.job_id = js2.job_id
   AND js1.skill_id < js2.skill_id
JOIN skills s1
    ON js1.skill_id = s1.skill_id
JOIN skills s2
    ON js2.skill_id = s2.skill_id
WHERE js1.skill_type = 'Required'
  AND js2.skill_type = 'Required'
GROUP BY
    s1.skill_name,
    s2.skill_name
HAVING COUNT(DISTINCT js1.job_id) >= 3
ORDER BY
    jobs_with_both_skills DESC,
    skill_1,
    skill_2
LIMIT 20;

-- QUERY 10: Required skills in explicitly labelled early-career jobs
-- RESEARCH QUESTION 9

SELECT
    jp.job_title,
    jp.job_category,
    jp.seniority_level,
    s.skill_name
FROM job_postings jp
JOIN job_skills js
    ON jp.job_id = js.job_id
JOIN skills s
    ON js.skill_id = s.skill_id
WHERE LOWER(TRIM(jp.seniority_level)) IN ('graduate', 'juniour')
  AND js.skill_type = 'Required'
ORDER BY
    jp.seniority_level,
    jp.job_category,
    s.skill_name;

-- QUERY 11: Qualification requirements by job category
-- RESEARCH QUESTION 7

SELECT
    job_category,
    qualification,
    COUNT(*) AS total_jobs
FROM job_postings
WHERE qualification IS NOT NULL
  AND TRIM(qualification) <> ''
GROUP BY
    job_category,
    qualification
ORDER BY
    job_category,
    total_jobs DESC;

-- QUERY 12: Experience requirements by job category
-- RESEARCH QUESTION 8

SELECT
    job_category,
    experience,
    COUNT(*) AS total_jobs
FROM job_postings
WHERE experience IS NOT NULL
  AND TRIM(experience) <> ''
GROUP BY
    job_category,
    experience
ORDER BY
    job_category,
    total_jobs DESC;

-- QUERY 13: Distribution of work arrangements
-- RESEARCH QUESTION 10:
-- What proportion of positions are remote, hybrid and on-site?

SELECT
    COALESCE(
        NULLIF(TRIM(work_arrangement), ''),
        'Not specified'
    ) AS work_arrangement,
    COUNT(*) AS total_jobs,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage_of_jobs
FROM job_postings
GROUP BY
    COALESCE(
        NULLIF(TRIM(work_arrangement), ''),
        'Not specified'
    )
ORDER BY total_jobs DESC;

-- QUERY 14: Work arrangements by job category
-- RESEARCH QUESTION 11:
-- Which categories have the highest proportion of remote opportunities?

SELECT
    job_category,
    work_arrangement,
    COUNT(*) AS total_jobs,
    ROUND(
        COUNT(*) * 100.0 /
        SUM(COUNT(*)) OVER (PARTITION BY job_category),
        2
    ) AS percentage_within_category
FROM job_postings
GROUP BY
    job_category,
    work_arrangement
ORDER BY
    job_category,
    total_jobs DESC;

-- QUERY 15: Salary data availability
-- RESEARCH QUESTION 12:
-- Which salary ranges are advertised for different data-related positions?

SELECT
    job_category,
    COUNT(*) AS total_jobs,
    COUNT(salary_min) AS jobs_with_salary_min,
    COUNT(salary_max) AS jobs_with_salary_max,
    COUNT(basic_salary) AS jobs_with_basic_salary,
    COUNT(*) - COUNT(salary_min) AS missing_salary_min,
    COUNT(*) - COUNT(salary_max) AS missing_salary_max
FROM job_postings
GROUP BY job_category
ORDER BY job_category;

-- QUERY 16: Inspect available salary information

SELECT
    job_title,
    job_category,
    salary_min,
    salary_max,
    basic_salary,
    salary_period,
    currency
FROM job_postings
WHERE salary_min IS NOT NULL
   OR salary_max IS NOT NULL
   OR basic_salary IS NOT NULL
ORDER BY job_category, job_title;

-- QUERY 17: Explicitly labelled entry-level opportunities
-- RESEARCH QUESTION 6

SELECT
    job_category,
    COUNT(*) AS total_jobs,
    COUNT(*) FILTER (
        WHERE LOWER(TRIM(seniority_level))
        IN ('graduate', 'junior', 'juniour')
    ) AS entry_level_jobs,
    ROUND(
        COUNT(*) FILTER (
            WHERE LOWER(TRIM(seniority_level))
            IN ('graduate', 'junior', 'juniour')
        ) * 100.0 / COUNT(*),
        2
    ) AS entry_level_percentage,
    COUNT(*) FILTER (
        WHERE seniority_level IS NULL
           OR TRIM(seniority_level) = ''
    ) AS unspecified_seniority
FROM job_postings
GROUP BY job_category
ORDER BY job_category;

-- QUERY 18: Most frequently required skills for entry-level jobs
-- RESEARCH QUESTION 9

SELECT
    s.skill_name,
    COUNT(DISTINCT js.job_id) AS total_jobs
FROM job_skills js
JOIN skills s
    ON js.skill_id = s.skill_id
JOIN job_postings jp
    ON js.job_id = jp.job_id
WHERE js.skill_type = 'Required'
  AND LOWER(TRIM(jp.seniority_level))
      IN ('graduate', 'junior', 'juniour')
GROUP BY s.skill_name
ORDER BY total_jobs DESC, s.skill_name;
