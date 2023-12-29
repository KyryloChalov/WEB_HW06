--- Знайти оцінки студентів у окремій групі з певного предмета
SELECT su.name as "Subject",
       g.name as "Group",
       st.name as "Student",
       gr.grade as "Grade"
FROM   students st
JOIN   grades gr ON gr.student_id = st.id
JOIN   subjects su ON gr.subject_id = su.id
JOIN   groups g ON g.id = st.group_id
WHERE  (
       su.id = 5
       AND g.id = 2
       )
ORDER BY "Student";
