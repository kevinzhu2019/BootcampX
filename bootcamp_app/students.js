const { Pool } = require('pg');

const pool = new Pool({
  user: 'vagrant',
  password: '123',
  host: 'localhost',
  database: 'bootcampx'
});

// const cohortNameAndLimit = process.argv.slice(2);
const queryString = `SELECT students.id, students.name AS student_name, cohorts.name AS cohort_name
FROM students
INNER JOIN cohorts ON cohorts.id = students.cohort_id
WHERE cohorts.name like $1
LIMIT $2;`
const cohortName = process.argv[2].toUpperCase();
const limit = process.argv[3];
const values = [`%${cohortName}%`, limit];
pool.query(queryString, values)
.then(result => {
  // console.log(result.rows);
  result.rows.forEach((item) => {
    console.log(`${item.student_name} has an id of ${item.id} and was in the ${item.cohort_name} cohort`);
  })
})
.catch(err => console.error('query error', err.stack));