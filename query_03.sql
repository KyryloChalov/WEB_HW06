--- Знайти середній бал у групах з певного предмета.
SELECT su.name as "Subject",
       g.name as "Group",
       ROUND(AVG(gr.grade), 2) as "Average grade"
FROM   grades gr
JOIN   students st ON gr.student_id = st.id
JOIN   subjects su ON gr.subject_id = su.id
JOIN   groups g ON g.id = st.group_id
WHERE  su.id = 5
GROUP BY "Group"
ORDER BY "Average grade" DESC;
