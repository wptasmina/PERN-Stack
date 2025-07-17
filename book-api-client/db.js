
// db.js
const { Pool } = require('pg');


const pool = new Pool({
  user: 'postgres',
  host: 'localhost',
  password: '123456', // replace with your actual password
  port: 5432,
  database: 'book_api', // replace with your actual database name
})
module.exports = pool;