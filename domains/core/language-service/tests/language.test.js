const request = require('supertest');
const app = require('../src/app');
const mongoose = require('mongoose');

beforeAll(async () => {
    await mongoose.connect(process.env.MONGO_URI, { useNewUrlParser: true, useUnifiedTopology: true });
});

afterAll(async () => {
    await mongoose.connection.close();
});

describe('Language API', () => {
    let id;

    test('creates a language', async () => {
        const res = await request(app)
            .post('/api/languages')
            .send({ code: 'en', name: 'English', active: true });
        expect(res.statusCode).toBe(201);
        expect(res.body.name).toBe('English');
        id = res.body._id;
    });

    test('gets all languages', async () => {
        const res = await request(app).get('/api/languages');
        expect(res.statusCode).toBe(200);
        expect(Array.isArray(res.body)).toBe(true);
    });

    test('gets a language by id', async () => {
        const res = await request(app).get(`/api/languages/${id}`);
        expect(res.statusCode).toBe(200);
        expect(res.body._id).toBe(id);
    });

    test('updates a language', async () => {
        const res = await request(app)
            .put(`/api/languages/${id}`)
            .send({ code: 'es', name: 'Español', active: true });
        expect(res.statusCode).toBe(200);
        expect(res.body.name).toBe('Español');
    });

    test('deletes a language', async () => {
        const res = await request(app).delete(`/api/languages/${id}`);
        expect(res.statusCode).toBe(204);
    });
});
