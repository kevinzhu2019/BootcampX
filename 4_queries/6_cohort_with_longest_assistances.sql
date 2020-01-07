SELECT c.name, avg(completed_at - started_at) AS average_assistance_time
FROM assistance_requests a
JOIN students s ON s.id = a.student_id
JOIN cohorts c ON c.id = s.cohort_id
GROUP BY c.name
ORDER BY average_assistance_time DESC
LIMIT 1;