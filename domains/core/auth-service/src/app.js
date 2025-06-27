require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { sequelize } = require('./config/db');
const authRoutes = require('./routes/authRoutes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/auth', authRoutes);

const PORT = process.env.PORT || 3001;

// Singleton pattern: single DB connection instance
sequelize.authenticate().then(() => {
    console.log('Database connected!');
    app.listen(PORT, () => console.log(`Auth Service running on port ${PORT}`));
}).catch(err => {
    console.error('DB connection failed:', err);
    process.exit(1);
});

module.exports = app;
