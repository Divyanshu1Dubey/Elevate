-- 1.  Top Performing Students
-- Get students with assessment score >= 90, sorted by highest IQ and attendance.
SELECT name, course_name, assesment_score, iq, attendance
FROM public.k12_data
WHERE assesment_score >= 90
ORDER BY iq DESC, attendance DESC
LIMIT 10;

-- ------------------------------------------------------------

-- 2.  Students by Country and Level
-- Count how many students are in each country and education level (primary, secondary, etc.).
SELECT country, level, COUNT(*) AS total_students
FROM public.k12_data
GROUP BY country, level
ORDER BY total_students DESC;

-- ------------------------------------------------------------

-- 3.  Most Popular Courses
-- Find the top 5 most enrolled courses across all students.
SELECT course_name, COUNT(*) AS enrolled_students
FROM public.k12_data
GROUP BY course_name
ORDER BY enrolled_students DESC
LIMIT 5;

-- ------------------------------------------------------------

-- 4.  Average Score by Course Level
-- Compute average assessment score for each course difficulty level.
SELECT course_level, AVG(assesment_score)::numeric(5,2) AS avg_score
FROM public.k12_data
GROUP BY course_level
ORDER BY avg_score DESC;

-- ------------------------------------------------------------

-- 5.  Correlation Check Between IQ and Assessment Score
-- Measure the Pearson correlation between IQ and assessment scores.
SELECT CORR(iq, assesment_score) AS iq_score_correlation
FROM public.k12_data;

-- ------------------------------------------------------------

-- 6.  Study Time vs Promotion Status
-- Show how average study time differs between promoted and non-promoted students.
SELECT promoted, AVG(study_time)::numeric(4,2) AS avg_study_time
FROM public.k12_data
GROUP BY promoted;

-- ------------------------------------------------------------

-- 7. 🎯 Students' Progress by Promotion Status
-- Show the number of students promoted and not promoted, grouped by course.
SELECT course_name, promoted, COUNT(*) AS total_students
FROM public.k12_data
GROUP BY course_name, promoted
ORDER BY course_name, promoted;

-- ------------------------------------------------------------

-- 8.  Students' IQ Range
-- Find the students who have IQ between 90 and 110 and their corresponding assessment scores.
SELECT name, iq, assesment_score
FROM public.k12_data
WHERE iq BETWEEN 90 AND 110
ORDER BY assesment_score DESC;

-- ------------------------------------------------------------

-- 9.  Total Study Time by Course
-- Calculate the total study time per course.
SELECT course_name, SUM(study_time) AS total_study_time
FROM public.k12_data
GROUP BY course_name
ORDER BY total_study_time DESC;

-- ------------------------------------------------------------

-- 10.  Top 3 Students by Attendance in Each Course
-- Use a subquery to find the top 3 students by attendance in each course.
SELECT name, course_name, attendance
FROM (
    SELECT name, course_name, attendance,
           ROW_NUMBER() OVER (PARTITION BY course_name ORDER BY attendance DESC) AS row_num
    FROM public.k12_data
) AS subquery
WHERE row_num <= 3
ORDER BY course_name, attendance DESC;

-- ------------------------------------------------------------

-- 11.  Correlation Between Study Time and IQ
-- Find the Pearson correlation between study time and IQ.
SELECT CORR(study_time, iq) AS study_time_iq_correlation
FROM public.k12_data;

-- ------------------------------------------------------------

-- 12. 🛠️ Creating a View for Average Assessment Score by Country
-- Create a view to store the average assessment score by country for further analysis.
CREATE VIEW avg_score_by_country AS
SELECT country, AVG(assesment_score)::numeric(5,2) AS avg_score
FROM public.k12_data
GROUP BY country;

-- ------------------------------------------------------------

-- 13.  Top 10 Students with the Highest Total Study Time
-- Find the top 10 students with the highest total study time.
SELECT name, SUM(study_time) AS total_study_time
FROM public.k12_data
GROUP BY name
ORDER BY total_study_time DESC
LIMIT 10;

-- ------------------------------------------------------------







-- 16.  Average Score and Total Students by Course Level
-- Use GROUP BY to calculate both average assessment scores and total students for each course level.
SELECT course_level, 
       AVG(assesment_score)::numeric(5,2) AS avg_score, 
       COUNT(*) AS total_students
FROM public.k12_data
GROUP BY course_level
ORDER BY avg_score DESC;

-- ------------------------------------------------------------



-- ------------------------------------------------------------

-- 18.  Optimizing with Index for Faster Queries
-- Create an index on assesment_score to optimize queries involving filtering on scores.
CREATE INDEX idx_assesment_score ON public.k12_data(assesment_score);
