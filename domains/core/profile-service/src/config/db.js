const mongoose = require('mongoose');
const { Pool } = require('pg');
const redis = require('redis');
require('dotenv').config();

let isConnected = false;

const pgPool = new Pool({
  host: process.env.POSTGRES_HOST,
  port: process.env.POSTGRES_PORT,
  user: process.env.POSTGRES_USER,
  password: process.env.POSTGRES_PASSWORD,
  database: process.env.POSTGRES_DB,
});

const redisClient = redis.createClient({
  socket: {
    host: process.env.REDIS_HOST,
    port: process.env.REDIS_PORT
  },
  password: process.env.REDIS_PASSWORD
});

async function connectDB() {
  if (isConnected) return;

  // MongoDB
  try {
    await mongoose.connect(process.env.MONGO_URI, {
      useNewUrlParser: true,
      useUnifiedTopology: true
    });
    console.log('✅ MongoDB connected');
  } catch (err) {
    console.error('❌ MongoDB error:', err.message);
  }

  // PostgreSQL
  try {
    await pgPool.connect();
    console.log('✅ PostgreSQL connected');
  } catch (err) {
    console.error('❌ PostgreSQL error:', err.message);
  }

  // Redis
  try {
    await redisClient.connect();
    console.log('✅ Redis connected');
  } catch (err) {
    console.error('❌ Redis error:', err.message);
  }

  isConnected = true;
}

module.exports = {
  connectDB,
  pgPool,
  redisClient
};
