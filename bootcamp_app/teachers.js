const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

pool.query(`
SELECT distinct t.name AS teacher, c.name AS cohort 
FROM assistance_requests ar
INNER JOIN teachers t ON t.id = ar.teacher_id
INNER JOIN students s ON s.id = ar.student_id
INNER JOIN cohorts c ON c.id = s.cohort_id
WHERE c.name like '%${process.argv[2]}%'
ORDER by teacher;
`)
.then (result => {
  console.log('conneted');
  result.rows.forEach((item) => {
    console.log(`${item.cohort}: ${item.teacher}`);
  })
})