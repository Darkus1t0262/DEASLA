from fastapi import FastAPI
from src.controller import router
from src.db import db  # Import your db instance (MongoDB)

app = FastAPI(
    title="Email Service",
    description="Handles email dispatch for DEAS-LA alerts.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/email")

@app.get("/")
def health_check():
    try:
        # Try a simple MongoDB command
        db.list_collection_names()
        return {"status": "ok"}
    except Exception as e:
        return {"status": "db_error", "details": str(e)}
