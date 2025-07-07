require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { connectNeo4j } = require('./config/neo4j');
const roleRoutes = require('./routes/roleRoutes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/roles', roleRoutes);

const PORT = process.env.SERVICE_PORT || 3006;

connectNeo4j()
  .then(() => {
    console.log('✅ Connected to Neo4j');
    app.listen(PORT, () =>
      console.log(`🚀 Role Service running on http://localhost:${PORT}`)
    );
  })
  .catch((err) => {
    console.error('❌ Neo4j connection failed:', err.message);
    process.exit(1);
  });

module.exports = app;
