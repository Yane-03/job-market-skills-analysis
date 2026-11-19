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
    date_posted DATE,
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
