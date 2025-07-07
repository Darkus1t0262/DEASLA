from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_graphql_query():
    response = client.post("/api/graphql/", json={"query": "{ users { id name } }"})
    assert response.status_code == 200
    data = response.json()
    assert "users" in data["data"]
