from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_soap_consume():
    response = client.post("/api/soap/", json={
        "action": "GetInfo",
        "payload": {}
    })
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "result" in data["data"]
