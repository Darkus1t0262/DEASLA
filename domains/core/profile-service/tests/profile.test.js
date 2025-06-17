const request = require('supertest');
const express = require('express');
const userRoutes = require('../src/routes/userRoutes');

const app = express();
app.use('/api/profiles', userRoutes);

describe('GET /api/profiles', () => {
  it('should return list of users', async () => {
    const res = await request(app).get('/api/profiles');
    expect(res.statusCode).toEqual(200);
    expect(res.body.length).toBeGreaterThan(0);
  });
});
