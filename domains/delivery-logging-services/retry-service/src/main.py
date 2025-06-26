from fastapi import FastAPI
from src.controller import router
from src.redis_conn import redis_client  # <--- import as named above

app = FastAPI(
    title="Retry Service",
    description="Handles message retry logic for DEAS-LA delivery.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/retry")

@app.get("/")
def health_check():
    try:
        redis_client.ping()  # Use the same name here
        return {"status": "ok"}
    except Exception as e:
        return {"status": "db_error", "details": str(e)}
