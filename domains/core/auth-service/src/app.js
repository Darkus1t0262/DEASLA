require('dotenv').config();
const express = require('express');
const cors = require('cors');
const promBundle = require('express-prom-bundle');
const { sequelize } = require('./config/db');
const authRoutes = require('./routes/authRoutes');

const app = express();
const metricsMiddleware = promBundle({
    includeMethod: true,
    includePath: true,
    customLabels: { project: 'auth-service' },
    promClient: {
        collectDefaultMetrics: {},
    },
});

app.use(cors());
app.use(express.json());
app.use(metricsMiddleware);  // 👈 Register Prometheus middleware

app.use('/api/auth', authRoutes);

const PORT = process.env.PORT || 3001;

sequelize.authenticate().then(() => {
    console.log('Database connected!');
    app.listen(PORT, () => console.log(`Auth Service running on port ${PORT}`));
}).catch(err => {
    console.error('DB connection failed:', err);
    process.exit(1);
});

module.exports = app;
