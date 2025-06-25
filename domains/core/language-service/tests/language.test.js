const request = require("supertest");
const app = require("../src/index");

describe("Language Service", () => {
  it("should return all languages", async () => {
    const res = await request(app).get("/languages");
    expect(res.statusCode).toBe(200);
    expect(Array.isArray(res.body)).toBe(true);
  });

  it("should create a new language", async () => {
    const res = await request(app)
      .post("/languages")
      .send({ code: "es", name: "Spanish" });
    expect(res.statusCode).toBe(201);
    expect(res.body).toHaveProperty("code", "es");
  });
});
