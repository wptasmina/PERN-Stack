


const {Pool} = require('pg'); //npm install pg

 
const pool = new Pool({
  host: 'localhost',
  user: 'postgres',
  password: '123456',
  port: 5432,
  database: 'bookApi',
})

module.exports = pool;