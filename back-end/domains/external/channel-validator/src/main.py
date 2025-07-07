from fastapi import FastAPI
from src.controller import router

app = FastAPI(
    title="Channel Validator Service",
    description="Validates external communication channels for DEAS-LA.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/channel-validator")

@app.get("/")
def health_check():
    return {"status": "ok"}
