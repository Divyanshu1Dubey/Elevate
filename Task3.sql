-- 1. Top Performing Students
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
