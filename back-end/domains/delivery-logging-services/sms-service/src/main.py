from fastapi import FastAPI
from src.controller import router
from src.db import db  # Adjust the import if needed

app = FastAPI(
    title="SMS Service",
    description="Handles SMS message dispatch for DEAS-LA alerts.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/sms")

@app.get("/")
def health_check():
    try:
        db.list_collection_names()  # MongoDB ping
        return {"status": "ok"}
    except Exception as e:
        return {"status": "db_error", "details": str(e)}
