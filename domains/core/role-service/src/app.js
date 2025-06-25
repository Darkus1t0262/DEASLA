require('dotenv').config();
const express = require('express');
const cors = require('cors');
const { connectNeo4j } = require('./config/neo4j');
const roleRoutes = require('./routes/roleRoutes');

const app = express();
app.use(cors());
app.use(express.json());

app.use('/api/roles', roleRoutes);

const PORT = process.env.PORT || 3006;

connectNeo4j().then(() => {
    app.listen(PORT, () => console.log(`Role Service running on port ${PORT}`));
}).catch(err => {
    console.error('Neo4j connection failed:', err);
    process.exit(1);
});

module.exports = app;
