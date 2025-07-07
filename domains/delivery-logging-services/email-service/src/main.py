from fastapi import FastAPI
from src.controller import router
from src.db import db  # MongoDB instance
from prometheus_fastapi_instrumentator import Instrumentator

app = FastAPI(
    title="Email Service",
    description="Handles email dispatch for DEAS-LA alerts.",
    version="1.0.0"
)

# 📊 Prometheus metrics
Instrumentator().instrument(app).expose(app)

# 📦 API routes
app.include_router(router, prefix="/api/email")

# ✅ Health check
@app.get("/")
def health_check():
    try:
        db.list_collection_names()
        return {"status": "ok"}
    except Exception as e:
        return {"status": "db_error", "details": str(e)}
