from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_retry_message():
    response = client.post("/api/retry/", json={
        "message_id": "msg-1",
        "payload": {"content": "Hello"}
    })
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True

    response = client.get("/api/retry/")
    assert response.status_code == 200
    data = response.json()
    assert isinstance(data["statuses"], list)
