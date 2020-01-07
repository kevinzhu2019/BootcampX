SELECT c.name, avg(a.completed_at - a.started_at) AS average_assistance_time FROM assistance_requests a
INNER JOIN students s ON s.id = a.student_id
INNER JOIN cohorts c ON c.id = s.cohort_id
GROUP BY c.name
ORDER BY avg(a.completed_at - a.started_at);