const request = require('supertest');
const app = require('../src/app');
const mongoose = require('mongoose');

beforeAll(async () => {
    await mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });
});

afterAll(async () => {
    await mongoose.connection.close();
});

describe('Profile API', () => {
    let id;

    test('creates a profile', async () => {
        const res = await request(app)
            .post('/api/profiles')
            .send({ userId: 'user123', fullName: 'Test User', phone: '555-1234' });
        expect(res.statusCode).toBe(201);
        expect(res.body.fullName).toBe('Test User');
        id = res.body._id;
    });

    test('gets all profiles', async () => {
        const res = await request(app).get('/api/profiles');
        expect(res.statusCode).toBe(200);
        expect(Array.isArray(res.body)).toBe(true);
    });

    test('gets a profile by id', async () => {
        const res = await request(app).get(`/api/profiles/${id}`);
        expect(res.statusCode).toBe(200);
        expect(res.body._id).toBe(id);
    });

    test('updates a profile', async () => {
        const res = await request(app)
            .put(`/api/profiles/${id}`)
            .send({ fullName: 'Updated Name', phone: '555-5678' });
        expect(res.statusCode).toBe(200);
        expect(res.body.fullName).toBe('Updated Name');
    });

    test('deletes a profile', async () => {
        const res = await request(app).delete(`/api/profiles/${id}`);
        expect(res.statusCode).toBe(204);
    });
});
