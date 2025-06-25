from fastapi import FastAPI
from src.controller import router

app = FastAPI(
    title="Email Service",
    description="Handles email dispatch for DEAS-LA alerts.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/email")

@app.get("/")
def health_check():
    return {"status": "ok"}
