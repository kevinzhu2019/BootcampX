SELECT c.name, sum(ar.completed_at - ar.started_at) AS total_duration FROM assistance_requests ar
INNER JOIN students s ON s.id = ar.student_id
INNER JOIN cohorts c ON c.id = s.cohort_id
GROUP BY c.name
ORDER BY total_duration;