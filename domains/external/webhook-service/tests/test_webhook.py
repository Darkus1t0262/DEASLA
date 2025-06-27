from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_webhook_event():
    response = client.post("/api/webhook/", json={
        "event_type": "external_update",
        "payload": {"key": "value"}
    })
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "Processed" in data["detail"]
