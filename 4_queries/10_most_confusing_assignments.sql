SELECT a.id, a.name, a.day, a.chapter, count(ar.*) AS total_requests FROM assistance_requests ar
INNER JOIN assignments a ON a.id = ar.assignment_id
GROUP BY a.id
ORDER BY total_requests DESC;