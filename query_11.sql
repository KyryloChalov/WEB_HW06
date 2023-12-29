--- Середній бал, який певний викладач ставить певному студентові.
SELECT  t.name as "Teacher",
        st.name as "Student",
        ROUND(AVG(gr.grade), 2) as "Average"
FROM    grades gr
JOIN    students st ON gr.student_id = st.id
JOIN    subjects su ON gr.subject_id = su.id
JOIN    teachers t ON t.id = su.teacher_id
WHERE  (
        st.id = 44
        AND t.id = 5
       )
;