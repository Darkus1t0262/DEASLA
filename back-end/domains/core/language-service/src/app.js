require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { connectDB } = require('./config/db');
const languageRoutes = require('./routes/languageRoutes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/languages', languageRoutes);

const PORT = process.env.PORT || 3005;

// Singleton pattern for MongoDB connection
connectDB().then(() => {
    app.listen(PORT, () => console.log(`Language Service running on port ${PORT}`));
}).catch(err => {
    console.error('MongoDB connection failed:', err);
    process.exit(1);
});

module.exports = app;
