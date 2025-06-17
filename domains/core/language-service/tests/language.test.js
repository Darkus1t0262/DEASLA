const request = require('supertest');
const express = require('express');
const userRoutes = require('../src/routes/userRoutes');

const app = express();
app.use('/api/languages', userRoutes);

describe('GET /api/languages', () => {
  it('should return list of users', async () => {
    const res = await request(app).get('/api/languages');
    expect(res.statusCode).toEqual(200);
    expect(res.body.length).toBeGreaterThan(0);
  });
});
