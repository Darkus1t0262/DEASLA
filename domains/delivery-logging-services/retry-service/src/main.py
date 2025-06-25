from fastapi import FastAPI
from src.controller import router

app = FastAPI(
    title="Retry Service",
    description="Handles message retry logic for DEAS-LA delivery.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/retry")

@app.get("/")
def health_check():
    return {"status": "ok"}
