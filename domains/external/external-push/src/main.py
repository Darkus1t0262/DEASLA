from fastapi import FastAPI
from prometheus_fastapi_instrumentator import Instrumentator
from src.controller import router

app = FastAPI(
    title="External Push Service",
    description="Handles push requests from external systems for DEAS-LA.",
    version="1.0.0"
)

# ✅ Add metrics
Instrumentator().instrument(app).expose(app)

# ✅ Include push routes
app.include_router(router, prefix="/api/external-push")

@app.get("/")
def health_check():
    return {"status": "ok"}
