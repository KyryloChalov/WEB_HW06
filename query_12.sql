--- Оцінки студентів у певній групі з певного предмета на останньому занятті.
SELECT  g.name as "Group",
        su.name as "Subject",
        st.name as "Student",
        gr.grade as "Grade",
        max(gr.grade_date) as date
FROM    grades gr
JOIN    subjects su ON gr.subject_id = su.id
JOIN    students st ON gr.student_id = st.id
JOIN    groups g ON g.id = st.group_id
WHERE   g.id = 2
        AND su.id = 5
GROUP BY "Student"
ORDER BY "Student"
;