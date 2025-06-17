from fastapi.testclient import TestClient
from main import app

client = TestClient(app)

def test_get_all():
    response = client.get("/api/emails")
    assert response.status_code == 200
    assert len(response.json()) > 0
