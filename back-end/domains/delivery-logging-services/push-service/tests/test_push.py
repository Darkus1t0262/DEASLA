from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_send_push():
    response = client.post("/api/push/send", json={
        "device_id": "device123",
        "title": "Test Push",
        "body": "This is a test notification"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "Push notification sent successfully" in data["detail"]
