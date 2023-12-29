--- Знайти середній бал, який ставить певний викладач зі своїх предметів
SELECT t.name as "Teacher",
       ROUND(AVG(gr.grade), 2) as "Average grade"
FROM   grades gr
JOIN   teachers t ON su.teacher_id = t.id
JOIN   subjects su ON su.id = gr.subject_id
WHERE  t.id = 2
;