-- creating raw job post table
CREATE TABLE raw_job_ads (
    job_id INTEGER,
    job_title TEXT,
    company TEXT,
    location TEXT,
    country TEXT,
    job_category TEXT,
    seniority_level TEXT,
    employment_type TEXT,
    work_arrangement TEXT,
    salary_min NUMERIC,
    salary_max NUMERIC,
	basic_salary NUMERIC,
	salary_period TEXT,
    currency TEXT,
    required_skills TEXT,
    preferred_skills TEXT,
    qualification TEXT,
    experience TEXT,
    cloud_platform TEXT,
    date_posted TEXT,
    date_recorded DATE,
    source TEXT,
    job_url TEXT
);
--normalising

--job posting table
CREATE TABLE job_postings (
    job_id INTEGER PRIMARY KEY,
    job_title TEXT,
    company TEXT,
    location TEXT,
    country TEXT,
    job_category TEXT,
    seniority_level TEXT,
    employment_type TEXT,
    work_arrangement TEXT,
    salary_min NUMERIC,
    salary_max NUMERIC,
    basic_salary NUMERIC,
    salary_period NUMERIC,
    currency TEXT,
    qualification TEXT,
    experience TEXT,
    cloud_platform TEXT,
    date_posted Text,
    date_collected DATE,
    source TEXT,
    job_url TEXT
);
--skills table
CREATE TABLE skills (
    skill_id SERIAL PRIMARY KEY,
    skill_name TEXT UNIQUE NOT NULL
);

--job skills table
CREATE TABLE job_skills (
    job_id INTEGER REFERENCES job_postings(job_id),
    skill_id INTEGER REFERENCES skills(skill_id),
    skill_type TEXT,
    PRIMARY KEY (job_id, skill_id, skill_type)
);

-- populating tables
INSERT INTO job_postings (
    job_id,
    job_title,
    company,
    location,
    country,
    job_category,
    seniority_level,
    employment_type,
    work_arrangement,
    salary_min,
    salary_max,
    basic_salary,
    salary_period,
    currency,
    qualification,
    experience,
    cloud_platform,
    date_posted,
    date_recorded,
    source,
    job_url
)
SELECT
    job_id::INTEGER,
    job_title,
    company,
    location,
    country,
    job_category,
    seniority_level,
    employment_type,
    work_arrangement,
    NULLIF(TRIM(salary_min), '')::NUMERIC,
    NULLIF(TRIM(salary_max), '')::NUMERIC,
    NULLIF(TRIM(basic_salary), '')::NUMERIC,
    salary_period,
    currency,
    qualification,
    experience,
    cloud_platform,
    date_posted,
    TO_DATE(date_recorded, 'DD/MM/YYYY'),
    source,
    job_url
FROM raw_job_ads;

-- populating and triming skills down
INSERT INTO skills (skill_name)
SELECT DISTINCT TRIM(skill)
FROM (
    SELECT UNNEST(STRING_TO_ARRAY(required_skills, ',')) AS skill
    FROM raw_job_ads

    UNION ALL

    SELECT UNNEST(STRING_TO_ARRAY(preferred_skills, ',')) AS skill
    FROM raw_job_ads
) AS all_skills
WHERE TRIM(skill) <> ''
ORDER BY TRIM(skill);

-- populating
INSERT INTO job_skills (
    job_id,
    skill_id,
    skill_type
)

-- Insert required skills
SELECT
    r.job_id::INTEGER,
    s.skill_id,
    'Required' AS skill_type
FROM raw_job_ads r
CROSS JOIN LATERAL
    UNNEST(STRING_TO_ARRAY(r.required_skills, ',')) AS skill
JOIN skills s
    ON LOWER(TRIM(skill)) = LOWER(s.skill_name)

UNION

-- Insert preferred skills
SELECT
    r.job_id::INTEGER,
    s.skill_id,
    'Preferred' AS skill_type
FROM raw_job_ads r
CROSS JOIN LATERAL
    UNNEST(STRING_TO_ARRAY(r.preferred_skills, ',')) AS skill
JOIN skills s
    ON LOWER(TRIM(skill)) = LOWER(s.skill_name);
