SELECT students.name AS student, AVG(assignment_submissions.duration) AS average_assignment_duration, AVG(assignments.duration) AS average_estimated_duration 
FROM assignment_submissions
INNER JOIN assignments ON assignments.id = assignment_submissions.assignment_id
INNER JOIN students ON students.id = assignment_submissions.student_id
WHERE students.end_date IS NULL
GROUP BY students.id
HAVING (AVG(assignment_submissions.duration) < AVG(assignments.duration))
ORDER BY AVG(assignment_submissions.duration);