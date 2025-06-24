const express = require('express');
const cors = require('cors');
const userRoutes = require('./routes/userRoutes');
const swaggerUi = require('swagger-ui-express');
const YAML = require('yamljs');

const app = express();
const port = process.env.PORT || 3000;

app.use(cors());
app.use(express.json());
app.use('/api/users', userRoutes);

const swaggerDocument = YAML.load('./swagger.yaml');
app.use('/api-docs', swaggerUi.serve, swaggerUi.setup(swaggerDocument));

// Export app for testing
if (process.env.NODE_ENV !== 'test') {
  app.listen(port, () => {
    console.log(`User service running at http://localhost:${port}`);
  });
}

module.exports = app;
