--- Знайти які курси читає певний викладач.
SELECT t.name as "Teacher",
       su.name as "Subject"
FROM   teachers t
JOIN   subjects su ON t.id = su.teacher_id
WHERE  t.id = 3
;
