const request = require('supertest');
const app = require('../src/app');
const { connectNeo4j, getDriver } = require('../src/config/neo4j');

beforeAll(async () => {
    await connectNeo4j();
});

afterAll(async () => {
    await getDriver().close();
});

describe('Role API', () => {
    const roleData = { name: 'admin', description: 'Administrator role' };

    test('creates a role', async () => {
        const res = await request(app)
            .post('/api/roles')
            .send(roleData);
        expect(res.statusCode).toBe(201);
        expect(res.body.name).toBe(roleData.name);
    });

    test('gets all roles', async () => {
        const res = await request(app).get('/api/roles');
        expect(res.statusCode).toBe(200);
        expect(Array.isArray(res.body)).toBe(true);
    });

    test('gets a role by name', async () => {
        const res = await request(app).get(`/api/roles/${roleData.name}`);
        expect(res.statusCode).toBe(200);
        expect(res.body.name).toBe(roleData.name);
    });

    test('updates a role', async () => {
        const res = await request(app)
            .put(`/api/roles/${roleData.name}`)
            .send({ description: 'Updated Admin' });
        expect(res.statusCode).toBe(200);
        expect(res.body.description).toBe('Updated Admin');
    });

    test('deletes a role', async () => {
        const res = await request(app).delete(`/api/roles/${roleData.name}`);
        expect(res.statusCode).toBe(204);
    });
});
