const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

const queryString = `SELECT distinct t.name AS teacher, c.name AS cohort 
FROM assistance_requests ar
INNER JOIN teachers t ON t.id = ar.teacher_id
INNER JOIN students s ON s.id = ar.student_id
INNER JOIN cohorts c ON c.id = s.cohort_id
WHERE c.name like $1
ORDER by teacher;`;

const cohort = process.argv[2].toUpperCase();

const value = [`%${cohort}%`];

pool.query(queryString, value)
.then (result => {
  console.log('conneted');
  result.rows.forEach((item) => {
    console.log(`${item.cohort}: ${item.teacher}`);
  })
})