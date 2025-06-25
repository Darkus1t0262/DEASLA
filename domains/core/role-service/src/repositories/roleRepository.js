const { getDriver } = require('../config/neo4j');

class RoleRepository {
    constructor() {
        this.driver = getDriver();
    }

    async createRole(data) {
        const session = this.driver.session();
        try {
            const result = await session.run(
                'CREATE (r:Role {name: $name, description: $description}) RETURN r',
                { name: data.name, description: data.description || '' }
            );
            const record = result.records[0];
            return record ? record.get('r').properties : null;
        } finally {
            await session.close();
        }
    }

    async getAllRoles() {
        const session = this.driver.session();
        try {
            const result = await session.run('MATCH (r:Role) RETURN r');
            return result.records.map(record => record.get('r').properties);
        } finally {
            await session.close();
        }
    }

    async getRoleByName(name) {
        const session = this.driver.session();
        try {
            const result = await session.run('MATCH (r:Role {name: $name}) RETURN r', { name });
            const record = result.records[0];
            return record ? record.get('r').properties : null;
        } finally {
            await session.close();
        }
    }

    async updateRole(name, data) {
        const session = this.driver.session();
        try {
            const result = await session.run(
                'MATCH (r:Role {name: $name}) SET r.description = $description RETURN r',
                { name, description: data.description }
            );
            const record = result.records[0];
            return record ? record.get('r').properties : null;
        } finally {
            await session.close();
        }
    }

    async deleteRole(name) {
        const session = this.driver.session();
        try {
            const result = await session.run('MATCH (r:Role {name: $name}) DELETE r RETURN COUNT(*) as count', { name });
            return result.summary.counters.updates().nodesDeleted > 0;
        } finally {
            await session.close();
        }
    }
}

module.exports = new RoleRepository();
