from fastapi import FastAPI
from src.controller import router

app = FastAPI(
    title="Push Service",
    description="Handles push notification delivery for DEAS-LA alerts.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/push")

@app.get("/")
def health_check():
    return {"status": "ok"}
