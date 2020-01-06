SELECT cohorts.name AS cohort_name, count(students.*) as student_count
FROM students 
INNER JOIN cohorts
ON cohorts.id = students.cohort_id
GROUP BY cohorts.name, students.cohort_id
HAVING count(students.*) >= 18
ORDER BY count(students.*);