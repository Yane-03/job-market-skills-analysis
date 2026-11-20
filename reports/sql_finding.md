## 1. Overall Job Market Overview

## Objective: Understand the overall size and structure of the collected job advertisement dataset.

## Results:
Total job advertisements: 30
Unique companies: 29
Job categories: 3
Locations: 9
Countries: 1 (South Africa)

## Initial observations:
The dataset contains 30 job advertisements from 29 different companies, covering three job categories and nine locations within South Africa.

## Limitation: This is a relatively small sample of job advertisements and should not be treated as a complete representation of the South African job market.

## 2. Job Distribution by Category

**Research Question 4:** Which data-related job categories have the highest representation?

**Results:**
- Data Engineering: 13 jobs (43.33%)
- Data Analyst: 11 jobs (36.67%)
- Data Science: 6 jobs (20.00%)

**Key findings:**
Data Engineering has the highest representation in the dataset, accounting for 43.33% of all advertisements. Data Analyst roles follow at 36.67%, while Data Science roles account for 20%.

Together, Data Engineering and Data Analyst positions represent 80% of the collected advertisements.

**Limitation:** These findings reflect the 30 advertisements collected and should not be generalised to the entire South African job market.

## 3. Seniority Level Distribution

**Research Question 6:** Which job categories have the highest proportion of entry-level opportunities?

**Initial results:**
- Unspecified seniority: 24 jobs (80.00%)
- Senior: 4 jobs (13.33%)
- Graduate: 1 job (3.33%)
- Juniour: 1 job (3.33%)

**Key findings:**
Most advertisements (80%) do not specify a seniority level. Only two advertisements explicitly indicate an early-career level: one Graduate and one Juniour position.

**Limitation:**
The high proportion of missing seniority information makes it difficult to determine the actual number of entry-level opportunities. Blank values should not automatically be classified as non-entry-level positions.

## 4. Seniority Distribution by Job Category

**Research Question 6:** Which categories have the highest proportion of entry-level opportunities?

**Results:**

| Job category | Unspecified | Graduate | Junior | Senior |
|---|---:|---:|---:|---:|
| Data Analyst | 9 | 1 | 1 | 0 |
| Data Engineering | 11 | 0 | 0 | 2 |
| Data Science | 4 | 0 | 0 | 2 |

**Key findings:**
Data Analyst is the only category with explicitly recorded Graduate and Junior positions. Data Engineering and Data Science each have two Senior advertisements.

**Limitation:**
Most advertisements do not specify seniority. Therefore, the results show explicitly labelled early-career opportunities rather than the actual number of entry-level opportunities.

## 5. Most Frequently Required Skills

**Research Question 1:** Which technical skills appear most frequently in data-related job advertisements?

**Top findings:**
- Python: 16 jobs
- SQL: 16 jobs
- Data Analysis: 14 jobs
- Data Modelling: 13 jobs
- Data Governance: 12 jobs
- Dashboard Development: 11 jobs
- Data Engineering: 11 jobs
- Data Quality Management: 11 jobs
- Data Warehousing: 11 jobs
- Data Visualisation: 10 jobs

**Key findings:**
Python and SQL are the most frequently required skills, each appearing in 16 advertisements. Data Analysis follows with 14 advertisements. The results also show strong demand for data management, modelling, governance and engineering-related capabilities.

**Methodological note:**
Skills are counted separately using their original recorded names. Related skills such as SQL, Advanced SQL and PostgreSQL are not combined.

## 6. Most Frequently Preferred Skills

**Research Question 1:** Which technical skills appear most frequently in job advertisements?

**Top findings:**
- Power BI: 5 jobs
- Python: 4 jobs
- Tableau: 4 jobs
- Apache Airflow: 3 jobs
- Financial Services Knowledge: 3 jobs
- Snowflake: 3 jobs

**Key findings:**
Power BI is the most frequently preferred skill, appearing in five advertisements. Python and Tableau follow with four advertisements each. Other preferred capabilities include cloud data platforms, data orchestration tools and industry-specific knowledge.

**Comparison:**
Python and SQL appear frequently as required skills, while Power BI leads the preferred-skills list. This highlights the importance of distinguishing between mandatory and advantageous skills.

**Methodological note:**
Required and preferred skills are analysed separately. Original skill names are retained without merging related terms.

## 7. Demand for SQL, Python, Excel and Power BI

**Research Question 2:** How frequently are SQL, Python, Excel and Power BI requested?

**Results:**

| Skill | Required | Preferred | Total |
|---|---:|---:|---:|
| Python | 16 | 4 | 20 |
| SQL | 16 | 2 | 18 |
| Power BI | 4 | 5 | 9 |
| Excel (all variations) | 6 | 1 | 6 distinct jobs |

**Key findings:**

Python is the most frequently mentioned skill, appearing in 20 advertisements, followed by SQL with 18. Power BI appears in nine advertisements, while Excel-related skills appear in six distinct advertisements.

Python and SQL are more frequently specified as mandatory requirements. Power BI appears slightly more often as a preferred skill.

**Excel data standardisation:**

Excel was recorded under three variations:
- Microsoft Excel
- Microsoft Excel (Advanced)
- Microsoft Excel (Advanced), preferred

These variations were grouped for the broader Excel demand comparison while preserving the original skill names in the database.

**Methodological note:**

Required and preferred skills are counted separately. A job advertisement can mention the same broader skill in more than one classification or under multiple variations. Distinct job counts are therefore used when calculating combined totals.

## 8. Skills Frequently Requested Together

**Research Question 3:** Which skills are most frequently requested together in the same job advertisements?

**Top skill combinations:**

| Skill combination | Number of jobs |
|---|---:|
| Python + SQL | 12 |
| Data Modelling + Python | 11 |
| Data Modelling + SQL | 11 |
| Data Engineering + Python | 10 |
| Data Governance + Data Modelling | 10 |
| Dashboard Development + Data Visualisation | 9 |
| Data Engineering + ETL | 9 |
| Data Governance + Python | 9 |
| Data Warehousing + ETL | 9 |
| ETL + Python | 9 |

**Key findings:**

Python and SQL are the most frequently occurring combination, appearing together in 12 advertisements (40% of the sample).

Data Modelling also appears frequently alongside Python and SQL, suggesting that employers value the ability to work with data structures in addition to programming and querying skills.

Data Engineering advertisements show strong combinations involving Python, ETL, Data Warehousing and Data Quality Management. Dashboard Development and Data Visualisation also frequently appear together.

**Methodological note:**

This analysis considers pairs of required skills appearing in the same advertisement. Each pair is counted by distinct job advertisement, and only combinations appearing in at least three advertisements are included. The results identify co-occurrence, not necessarily a causal or formal relationship between skills.

## 9. Skills Required for Explicitly Labelled Early-Career Positions

**Research Question 9:** Which technical skills are requested most frequently for entry-level positions?

**Positions identified:**

| Job title | Category | Seniority | Required skills |
|---|---|---|---:|
| Analytics Graduate Analyst | Data Analyst | Graduate | 10 |
| Junior Analytics Scpecialist | Data Analyst | Juniour | 5 |

**Key findings:**

Both explicitly labelled early-career advertisements belong to the Data Analyst category.

The Graduate advertisement emphasises transferable skills, including analytical thinking, critical thinking, communication, adaptability and problem-solving.

The Junior advertisement includes more explicit data-related requirements, such as Data Analysis, Data Literacy and Google Sheets.

Attention to detail and communication-related capabilities appear in both advertisements.

**Limitation:**

Only two advertisements explicitly identify themselves as Graduate or Junior positions. The results are therefore exploratory and cannot establish general entry-level skill requirements across the South African data job market.

**Data quality note:**

The original seniority value `Juniour` and job title `Junior Analytics Scpecialist` are retained as recorded in the source dataset.

## 10. Qualification Requirements

**Research Question 7:** What qualifications are employers requesting?

**Results:**

| Job category | Jobs with qualification information |
|---|---:|
| Data Analyst | 6 |
| Data Engineering | 10 |
| Data Science | 4 |
| **Total** | **20** |

**Key findings:**

Twenty of the 30 advertisements contain qualification information.

Bachelor's degrees in Computer Science, Mathematics, Statistics, Data Science and Information Systems feature prominently across the advertisements.

Data Science advertisements frequently emphasise quantitative disciplines, while Data Engineering advertisements include a broader range of qualifications, including Computer Science, Information Technology, Engineering and Mathematics.

Some employers accept equivalent practical experience, while others mention postgraduate qualifications or professional certifications as advantageous.

**Limitation:**

Qualification descriptions are stored as original text and have not yet been standardised into qualification levels or subject categories. Therefore, this analysis identifies recurring themes rather than establishing the most frequently requested exact qualification.

## 11. Experience Requirements by Job Category

**Research Question 8:** How much experience is typically required for data-related positions?

**Results:**

| Experience | Data Analyst | Data Engineering | Data Science |
|---|---:|---:|---:|
| 0+ years | 1 | 0 | 0 |
| 1+ years | 1 | 0 | 1 |
| 2+ years | 0 | 1 | 0 |
| 3+ years | 3 | 4 | 0 |
| 4+ years | 0 | 2 | 1 |
| 5+ years | 4 | 2 | 2 |
| 6+ years | 0 | 1 | 0 |
| 7+ years | 0 | 1 | 1 |
| 8+ years | 0 | 1 | 0 |

**Key findings:**

Twenty-six advertisements contain experience information. The most frequently recorded requirement is 5+ years, appearing in eight advertisements.

Data Analyst positions most frequently request 5+ years of experience, while Data Engineering positions show a wider range of requirements, from 2+ to 8+ years.

Data Science advertisements also tend towards experienced candidates, with two of the five advertisements requesting 5+ years.

**Limitation:**

Experience values are retained as originally recorded. The analysis assumes that values such as 3+ and 5+ represent minimum experience thresholds. Four advertisements have no recorded experience information.

## 12. Distribution of Work Arrangements

**Research Question 10:** What proportion of positions are remote, hybrid and on-site?

**Results:**

| Work Arrangement | Number of Jobs | Percentage |
|---|---:|---:|
| On-site | 16 | 53.33% |
| Hybrid | 12 | 40.00% |
| Remote | 2 | 6.67% |
| **Total** | **30** | **100%** |

**Key findings:**

On-site positions represent the largest proportion of advertisements, accounting for 53.33% of the dataset. Hybrid positions account for 40%, while fully remote opportunities represent only 6.67%.

Overall, 93.33% of the advertised positions are either on-site or hybrid. This indicates that fully remote opportunities are relatively limited within this sample.

**Limitation:**

These findings describe only the 30 advertisements collected for this project and should not be interpreted as a representation of the entire South African data job market.

## 13. Work Arrangements by Job Category

**Research Question 11:** Which categories have the highest proportion of remote opportunities?

**Results:**

| Job Category | On-site | Hybrid | Remote |
|---|---:|---:|---:|
| Data Analyst | 63.64% | 27.27% | 9.09% |
| Data Engineering | 38.46% | 53.85% | 7.69% |
| Data Science | 66.67% | 33.33% | 0% |

**Key findings:**

Data Analyst positions have the highest proportion of remote opportunities at 9.09%, followed by Data Engineering at 7.69%. No fully remote opportunities were identified among the Data Science advertisements.

Data Engineering positions are more commonly hybrid, with 53.85% of advertisements offering this arrangement. Data Science has the highest proportion of on-site positions at 66.67%.

Although Data Analyst has the highest remote percentage, Data Analyst and Data Engineering each have only one remote advertisement.

**Limitation:**

The findings are based on a sample of 30 advertisements. Percentages are calculated within each job category, rather than across the entire dataset.

## 14. Salary Data Availability

**Research Question 12:** Which salary ranges are advertised for different data-related positions?

**Results:**

| Job Category | Total Jobs | Jobs with Salary Minimum | Jobs with Salary Maximum | Jobs with Basic Salary |
|---|---:|---:|---:|---:|
| Data Analyst | 11 | 2 | 2 | 1 |
| Data Engineering | 13 | 0 | 0 | 0 |
| Data Science | 6 | 0 | 0 | 0 |
| **Total** | **30** | **2** | **2** | **1** |

**Key findings:**

Only two of the 30 advertisements (6.67%) contain minimum and maximum salary figures. Both advertisements belong to the Data Analyst category.

No salary ranges were recorded for Data Engineering or Data Science positions. Overall, 93.33% of advertisements have missing minimum and maximum salary information.

**Limitation:**

The limited availability of salary information prevents meaningful salary comparisons between job categories. Salary figures also need to be interpreted alongside their currencies and payment periods.

## 15. Inspection of Available Salary Records

**Research Question 12:** Which salary ranges are advertised for different data-related positions?

**Available salary records:**

| Job Title | Minimum Salary | Maximum Salary | Basic Salary | Currency | Period |
|---|---:|---:|---:|---|---|
| Data Analyst | Not provided | Not provided | 25,000 | ZAR | Monthly |
| Data Analyst | 550 | 700 | Not provided | ZAR | Hourly |
| Junior Analytics Specialist | 13,600 | 20,400 | Not provided | USD | Monthly |

**Key findings:**

Only three advertisements contain some form of salary information. Two provide salary ranges, while one provides a basic salary.

The records use different payment periods (hourly and monthly) and currencies (ZAR and USD). Consequently, direct salary comparisons and average salary calculations would not be statistically meaningful without additional assumptions and conversions.

**Limitation:**

Salary information is insufficient to establish reliable salary trends across Data Analyst, Data Engineering and Data Science positions. The original salary values, currencies and payment periods have been retained without modification.

## 16. Entry-Level Opportunities by Job Category

**Research Question 6:** Which categories have the highest proportion of entry-level opportunities?

**Results:**

| Job Category | Total Jobs | Entry-Level Jobs | Entry-Level Percentage | Unspecified Seniority |
|---|---:|---:|---:|---:|
| Data Analyst | 11 | 2 | 18.18% | 9 |
| Data Engineering | 13 | 0 | 0.00% | 11 |
| Data Science | 6 | 0 | 0.00% | 4 |

**Key findings:**

Data Analyst has the highest proportion of explicitly labelled entry-level opportunities, accounting for 18.18% of its advertisements.

No Data Engineering or Data Science advertisements were explicitly labelled Graduate or Junior.

However, 80% of all advertisements do not specify a seniority level. This means the analysis cannot establish whether these categories genuinely have fewer entry-level opportunities.

**Limitation:**

Entry-level opportunities were identified using explicit Graduate and Junior seniority labels. The original dataset contains the spelling "Juniour" for one advertisement, which was also included in the analysis. Advertisements with unspecified seniority cannot reliably be classified as entry-level or experienced positions.

## 17. Most Frequently Required Skills for Entry-Level Positions

**Research Question 9:** Which technical skills are requested most frequently for entry-level positions?

**Results:**

The analysis identified 15 distinct required skill names across the two advertisements explicitly labelled Graduate or Junior. Each skill appeared in one advertisement.

**Graduate Data Analyst:**
- Adaptability
- Analytical Thinking
- Attention to Detail
- Communication
- Continuous Learning
- Critical Thinking
- Prioritisation
- Problem Solving
- Teamwork
- Time Management

**Junior Analytics Specialist:**
- Attention to Detail Communication
- Data Analysis
- Data Literacy
- English Communication
- Google Sheets

**Key findings:**

The Graduate Data Analyst advertisement emphasises transferable skills such as adaptability, critical thinking, teamwork and problem-solving.

The Junior Analytics Specialist advertisement includes more directly data-related requirements, including Data Analysis, Data Literacy and Google Sheets.

No individual skill appeared in both advertisements. Therefore, the analysis cannot establish a common or consistently demanded skill set for entry-level positions.

**Limitation:**

Only two advertisements were explicitly labelled Graduate or Junior. The findings represent a very small sample and should not be treated as definitive entry-level industry requirements. The original skill labels have been retained, including combined or inconsistently formatted entries.
