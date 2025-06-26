require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { sequelize } = require('./config/db');
const userRoutes = require('./routes/userRoutes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/users', userRoutes);

// --- Healthcheck endpoint ---
app.get('/health', async (req, res) => {
  try {
    await sequelize.authenticate();
    res.send('OK');
  } catch (err) {
    res.status(500).send('DB error');
  }
});

const PORT = process.env.PORT || 3002;

sequelize.authenticate().then(() => {
    console.log('User DB connected!');
    app.listen(PORT, () => console.log(`User Service running on port ${PORT}`));
}).catch(err => {
    console.error('DB connection failed:', err);
    process.exit(1);
});

module.exports = app;
