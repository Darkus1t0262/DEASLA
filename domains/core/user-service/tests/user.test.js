const request = require('supertest');
const app = require('../src/app');
const { sequelize } = require('../src/config/db');

beforeAll(async () => {
    await sequelize.sync({ force: true });
});

afterAll(async () => {
    await sequelize.close();
});

describe('User API', () => {
    let id;

    test('creates a user', async () => {
        const res = await request(app)
            .post('/api/users')
            .send({ username: 'testuser', email: 'test@example.com' });
        expect(res.statusCode).toBe(201);
        expect(res.body.username).toBe('testuser');
        id = res.body.id;
    });

    test('gets all users', async () => {
        const res = await request(app).get('/api/users');
        expect(res.statusCode).toBe(200);
        expect(Array.isArray(res.body)).toBe(true);
    });

    test('gets a user by id', async () => {
        const res = await request(app).get(`/api/users/${id}`);
        expect(res.statusCode).toBe(200);
        expect(res.body.id).toBe(id);
    });

    test('updates a user', async () => {
        const res = await request(app)
            .put(`/api/users/${id}`)
            .send({ username: 'updated', email: 'upd@example.com' });
        expect(res.statusCode).toBe(200);
        expect(res.body.username).toBe('updated');
    });

    test('deletes a user', async () => {
        const res = await request(app).delete(`/api/users/${id}`);
        expect(res.statusCode).toBe(204);
    });
});
