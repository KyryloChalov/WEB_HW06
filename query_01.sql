--- Знайти 5 студентів із найбільшим середнім балом з усіх предметів.
SELECT st.name as "Student", 
       ROUND(AVG(g.grade), 2) as "Average Grade"
FROM   students st
JOIN   grades g ON g.student_id = st.id
GROUP BY "Student"
ORDER BY "Average grade" DESC
LIMIT 5;
