--- Знайти список курсів, які відвідує студент.
SELECT st.name as "Student",
       su.name as "Subject"
FROM   grades gr
JOIN   students st ON gr.student_id = st.id
JOIN   subjects su ON gr.subject_id = su.id
WHERE  st.id = 28
;