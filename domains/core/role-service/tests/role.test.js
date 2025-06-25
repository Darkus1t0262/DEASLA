const request = require("supertest");
const app = require("../src/index"); // Ensure app is exported from index.js

describe("Role Service", () => {
  it("should return all roles", async () => {
    const res = await request(app).get("/roles");
    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
  });

  it("should create a new role", async () => {
    const res = await request(app)
      .post("/roles")
      .send({ name: "responder" });
    expect(res.statusCode).toBe(201);
    expect(res.body).toHaveProperty("name", "responder");
  });
});
