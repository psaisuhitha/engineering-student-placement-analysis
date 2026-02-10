CREATE DATABASE engineering_placement_analysis;
USE engineering_placement_analysis;
CREATE TABLE student_data (
    Student_ID INT PRIMARY KEY,
    gender VARCHAR(10),
    branch VARCHAR(10),
    cgpa DECIMAL(3,2),
    tenth_percentage DECIMAL(5,2),
    twelfth_percentage DECIMAL(5,2),
    backlogs INT,
    study_hours_per_day DECIMAL(3,1),
    attendance_percentage DECIMAL(5,2),
    projects_completed INT,
    aptitude_skill_rating INT,
    hackathons_participated INT,
    certifications_count INT,
    sleep_hours DECIMAL(3,1),
    stress_level INT,
    part_time_job VARCHAR(5),
    family_income_level VARCHAR(10),
    city_tier VARCHAR(10),
    internet_access VARCHAR(5),
    extracurricular_involvement VARCHAR(10)
);
SHOW TABLES;
DROP TABLE student_data;
CREATE TABLE student_data (
    Student_ID INT,
    gender VARCHAR(10),
    branch VARCHAR(10),
    cgpa DECIMAL(3,2),
    tenth_percentage DECIMAL(5,2),
    twelfth_percentage DECIMAL(5,2),
    backlogs INT,
    study_hours_per_day DECIMAL(3,1),
    attendance_percentage DECIMAL(5,2),
    projects_completed INT,
    aptitude_skill_rating INT,
    hackathons_participated INT,
    certifications_count INT,
    sleep_hours DECIMAL(3,1),
    stress_level INT,
    part_time_job VARCHAR(5),
    family_income_level VARCHAR(10),
    city_tier VARCHAR(10),
    internet_access VARCHAR(5),
    extracurricular_involvement VARCHAR(10)
);
SELECT COUNT(*) FROM student_data_import;
SELECT *
FROM student_data_import
LIMIT 5;
SELECT 
    branch,
    ROUND(AVG(cgpa), 2) AS avg_cgpa
FROM student_data_import
GROUP BY branch
ORDER BY avg_cgpa DESC;
SELECT 
    gender,
    COUNT(*) AS student_count
FROM student_data_import
GROUP BY gender;
SELECT 
    branch,
    ROUND(AVG(projects_completed), 1) AS avg_projects,
    ROUND(AVG(hackathons_participated), 1) AS avg_hackathons
FROM student_data_import
GROUP BY branch
ORDER BY avg_projects DESC;
SELECT
    CASE
        WHEN cgpa >= 8 THEN 'High CGPA'
        WHEN cgpa >= 6 THEN 'Medium CGPA'
        ELSE 'Low CGPA'
    END AS cgpa_category,
    COUNT(*) AS student_count
FROM student_data_import
GROUP BY cgpa_category;
SELECT
    Student_ID,
    cgpa,
    projects_completed,
    hackathons_participated,
    aptitude_skill_rating
FROM student_data_import
WHERE cgpa < 7
  AND aptitude_skill_rating >= 4
ORDER BY aptitude_skill_rating DESC;
SELECT
    branch,
    ROUND(AVG(cgpa), 2) AS avg_cgpa
FROM student_data_import
GROUP BY branch
HAVING AVG(cgpa) > (
    SELECT AVG(cgpa) FROM student_data_import
);
SELECT
    Student_ID,
    branch,
    cgpa,
    RANK() OVER (PARTITION BY branch ORDER BY cgpa DESC) AS branch_rank
FROM student_data_import;
