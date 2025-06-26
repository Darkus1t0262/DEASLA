from fastapi import FastAPI
from src.controller import router
from src.db import db  # Adjust this path if your db.py is elsewhere

app = FastAPI(
    title="Push Service",
    description="Handles push notification delivery for DEAS-LA alerts.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/push")

@app.get("/")
def health_check():
    try:
        db.list_collection_names()
        return {"status": "ok"}
    except Exception as e:
        return {"status": "db_error", "details": str(e)}
