const request = require("supertest");
const app = require("../src/index"); // Adjust if app is exported elsewhere

describe("User Service API", () => {
  it("should return 200 OK on GET /users", async () => {
    const response = await request(app).get("/users");
    expect(response.statusCode).toBe(200);
    expect(Array.isArray(response.body)).toBe(true);
  });

  it("should return 201 Created on POST /users", async () => {
    const newUser = {
      name: "Test User",
      email: "test@example.com",
      password: "securepass123"
    };
    const response = await request(app).post("/users").send(newUser);
    expect(response.statusCode).toBe(201);
    expect(response.body).toHaveProperty("id");
  });
});
  