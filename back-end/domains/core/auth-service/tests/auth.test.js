const request = require('supertest');
const app = require('../src/app');
const { sequelize } = require('../src/config/db');

beforeAll(async () => {
    await sequelize.sync({ force: true });
});

afterAll(async () => {
    await sequelize.close();
});

describe('Auth API', () => {
    test('registers a user', async () => {
        const res = await request(app)
            .post('/api/auth/register')
            .send({ username: 'testuser', password: 'testpass' });
        expect(res.statusCode).toBe(201);
        expect(res.body.username).toBe('testuser');
    });

    test('logs in a user', async () => {
        await request(app)
            .post('/api/auth/register')
            .send({ username: 'loginuser', password: 'loginpass' });
        const res = await request(app)
            .post('/api/auth/login')
            .send({ username: 'loginuser', password: 'loginpass' });
        expect(res.statusCode).toBe(200);
        expect(res.body.token).toBeDefined();
    });
});
