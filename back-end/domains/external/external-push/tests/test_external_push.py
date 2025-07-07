from fastapi.testclient import TestClient
from src.main import app

client = TestClient(app)

def test_external_push():
    response = client.post("/api/external-push/", json={
        "target": "mobile-app",
        "message": "Update available"
    })
    assert response.status_code == 200
    data = response.json()
    assert data["success"] is True
    assert "Push delivered" in data["detail"]
