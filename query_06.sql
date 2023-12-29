--- Знайти список студентів у певній групі.
SELECT g.name as "Group",
       st.name as "Student"
FROM   students st
JOIN   groups g on g.id = st.group_id
WHERE  g.id = 2;