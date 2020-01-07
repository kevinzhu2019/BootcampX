SELECT teachers.name AS teacher, students.name AS student, assignments.name AS assignment, (assistance_requests.completed_at - assistance_requests.started_at) AS duration 
FROM assistance_requests
INNER JOIN students ON assistance_requests.student_id = students.id
INNER JOIN teachers ON teachers.id = assistance_requests.teacher_id
INNER JOIN assignments ON assignments.id = assistance_requests.assignment_id
ORDER BY duration;