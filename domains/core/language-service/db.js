require('dotenv').config(); // Loads .env

const { Pool } = require('pg');

const pool = new Pool({
  host: process.env.POSTGRES_HOST,
  port: process.env.POSTGRES_PORT,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
});

pool.connect()
  .then(() => console.log('✅ Connected to PostgreSQL!'))
  .catch(err => console.error('❌ PostgreSQL connection error:', err));

module.exports = pool;
 