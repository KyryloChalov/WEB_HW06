--- Знайти студента із найвищим середнім балом з певного предмета.
SELECT su.name as "Subject",
       st.name as "Student",
       ROUND(AVG(g.grade), 2) as "Average grade"
FROM   grades g
JOIN   students st ON g.student_id = st.id
JOIN   subjects su ON g.subject_id = su.id
WHERE  su.id = 4
GROUP BY "Subject";

-- SELECT d.name, s.fullname, ROUND(AVG(g.grade), 2) AS average_grade
-- FROM grades g
--     JOIN students s ON s.id = g.student_id
--     JOIN disciplines d ON d.id = g.discipline_id
-- WHERE d.id = 4
-- GROUP BY s.fullname
-- ORDER BY average_grade DESC
-- LIMIT 1;