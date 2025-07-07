const neo4j = require('neo4j-driver');

let driver;

async function connectNeo4j() {
    if (!driver) {
        driver = neo4j.driver(
            process.env.NEO4J_URI,
            neo4j.auth.basic(process.env.NEO4J_USER, process.env.NEO4J_PASSWORD)
        );
        // Test the connection
        await driver.verifyConnectivity();
        console.log('Neo4j connected!');
    }
    return driver;
}

function getDriver() {
    if (!driver) throw new Error('Neo4j driver not initialized');
    return driver;
}

module.exports = { connectNeo4j, getDriver };
