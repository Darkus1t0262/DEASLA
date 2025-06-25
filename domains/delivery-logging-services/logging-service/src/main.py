from fastapi import FastAPI
from src.controller import router

app = FastAPI(
    title="Logging Service",
    description="Records and queries delivery logs for DEAS-LA.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/logs")

@app.get("/")
def health_check():
    return {"status": "ok"}
