from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_send_email():
    response = client.post("/api/email/send", json={
        "to": "test@example.com",
        "subject": "Test Email",
        "body": "Hello from test!"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "Email sent successfully" in data["detail"]
