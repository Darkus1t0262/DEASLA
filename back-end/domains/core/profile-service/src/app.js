require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { connectDB } = require('./config/db');
const profileRoutes = require('./routes/profileRoutes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/profiles', profileRoutes);

const PORT = process.env.PORT || 3003;

// Singleton pattern for DB connection
connectDB().then(() => {
    app.listen(PORT, () => console.log(`Profile Service running on port ${PORT}`));
}).catch(err => {
    console.error('MongoDB connection failed:', err);
    process.exit(1);
});

module.exports = app;
