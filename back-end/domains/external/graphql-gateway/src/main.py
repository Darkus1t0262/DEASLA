from fastapi import FastAPI
from src.controller import router

app = FastAPI(
    title="GraphQL Gateway",
    description="Aggregates and exposes data via GraphQL API.",
    version="1.0.0"
)

app.include_router(router, prefix="/api/graphql")

@app.get("/")
def health_check():
    return {"status": "ok"}
