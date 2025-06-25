from fastapi import FastAPI
from src.controller import router

app = FastAPI(
    title="SOAP Consumer",
    description="Handles SOAP-based integration for DEAS-LA.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/soap")

@app.get("/")
def health_check():
    return {"status": "ok"}
