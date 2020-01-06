SELECT cohorts.name as cohort, count(assignment_submissions.id) as total_submissions
FROM assignment_submissions
INNER JOIN students ON students.id = assignment_submissions.student_id
INNER JOIN cohorts ON cohorts.id = students.cohort_id
GROUP BY cohorts.name
ORDER BY count(assignment_submissions.id) DESC;