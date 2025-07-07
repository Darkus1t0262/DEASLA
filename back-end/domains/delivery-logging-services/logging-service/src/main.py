from fastapi import FastAPI
from src.controller import router
from src.db import db
from src.consumer import start_kafka_consumer  # ✅ Updated import!
import threading

app = FastAPI(
    title="Logging Service",
    description="Records and queries delivery logs for DEAS-LA.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/logs")

@app.get("/")
def health_check():
    try:
        db.list_collection_names()
        return {"status": "ok"}
    except Exception as e:
        return {"status": "db_error", "details": str(e)}

@app.on_event("startup")
def startup_event():
    thread = threading.Thread(target=start_kafka_consumer, daemon=True)
    thread.start()
