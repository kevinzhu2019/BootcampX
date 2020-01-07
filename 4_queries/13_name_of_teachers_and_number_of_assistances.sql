SELECT distinct t.name AS teacher, c.name AS cohort, count(ar.id) AS total_assistances
FROM assistance_requests ar
INNER JOIN teachers t ON t.id = ar.teacher_id
INNER JOIN students s ON s.id = ar.student_id
INNER JOIN cohorts c ON c.id = s.cohort_id
WHERE c.name = 'JUL02'
GROUP BY c.name, t.name
ORDER by teacher;