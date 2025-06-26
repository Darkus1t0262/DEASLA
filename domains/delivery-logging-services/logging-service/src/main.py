from fastapi import FastAPI
from src.controller import router
from src.db import db  # Adjust this import if your db.py is elsewhere

app = FastAPI(
    title="Logging Service",
    description="Records and queries delivery logs for DEAS-LA.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/logs")

@app.get("/")
def health_check():
    try:
        db.list_collection_names()  # MongoDB ping
        return {"status": "ok"}
    except Exception as e:
        return {"status": "db_error", "details": str(e)}
