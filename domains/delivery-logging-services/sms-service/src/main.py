from fastapi import FastAPI
from src.controller import router

app = FastAPI(
    title="SMS Service",
    description="Handles SMS message dispatch for DEAS-LA alerts.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/sms")

@app.get("/")
def health_check():
    return {"status": "ok"}
