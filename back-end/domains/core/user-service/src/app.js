require('dotenv').config();
const express = require('express');
const cors = require('cors');
const promBundle = require('express-prom-bundle');
const { sequelize } = require('./config/db');
const userRoutes = require('./routes/userRoutes');

const app = express();

// Prometheus metrics middleware
const metricsMiddleware = promBundle({
  includeMethod: true,
  includePath: true,
  promClient: { collectDefaultMetrics: {} },
  customLabels: { project: 'user-service' }
});

app.use(cors());
app.use(express.json());
app.use(metricsMiddleware); // 👈 injects /metrics automatically

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

// ✅ Authenticate, then sync DB, then start server
sequelize.authenticate()
  .then(() => {
    console.log('✅ User DB connected!');
    return sequelize.sync({ alter: true });  // auto-create/update tables
  })
  .then(() => {
    console.log('✅ Sequelize sync complete!');
    app.listen(PORT, () => {
      console.log(`🚀 User Service running on port ${PORT}`);
    });
  })
  .catch((err) => {
    console.error('❌ Startup failed:', err);
    process.exit(1);
  });

module.exports = app;
