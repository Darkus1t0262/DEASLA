const mongoose = require('mongoose');
const { Pool } = require('pg');
require('dotenv').config();

let isConnected = false;

// PostgreSQL
const pgPool = new Pool({
  host: process.env.POSTGRES_HOST,
  port: process.env.POSTGRES_PORT,
  database: process.env.POSTGRES_DB,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
});

async function connectDB() {
  if (isConnected) return;

  // Connect to MongoDB
  try {
    await mongoose.connect(process.env.MONGO_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true,
    });
    console.log('✅ Connected to MongoDB');
  } catch (err) {
    console.error('❌ MongoDB connection error:', err.message);
  }

  // Connect to PostgreSQL
  try {
    await pgPool.connect();
    console.log('✅ Connected to PostgreSQL');
  } catch (err) {
    console.error('❌ PostgreSQL connection error:', err.message);
  }

  isConnected = true;
}

module.exports = {
  connectDB,
  pgPool,
};
