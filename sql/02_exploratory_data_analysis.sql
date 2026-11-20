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
