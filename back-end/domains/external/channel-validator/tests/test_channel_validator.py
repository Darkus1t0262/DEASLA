from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_email_validation():
    response = client.post("/api/channel-validator/", json={
        "channel": "email",
        "address": "someone@example.com"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["valid"] is True

def test_sms_validation():
    response = client.post("/api/channel-validator/", json={
        "channel": "sms",
        "address": "+593999999999"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["valid"] is True

def test_invalid():
    response = client.post("/api/channel-validator/", json={
        "channel": "sms",
        "address": "nope"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["valid"] is False
