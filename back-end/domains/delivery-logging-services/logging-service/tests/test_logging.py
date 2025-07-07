from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_create_and_list_logs():
    response = client.post("/api/logs/", json={
        "service": "sms-service",
        "message": "Test log"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert data["log"]["service"] == "sms-service"

    response = client.get("/api/logs/")
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data["logs"], list)
