from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_send_sms():
    response = client.post("/api/sms/send", json={
        "phone_number": "+1234567890",
        "message": "Test SMS"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "SMS sent successfully" in data["detail"]
