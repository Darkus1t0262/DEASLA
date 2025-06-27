from src.config import mongo_db

async def push_to_external(target: str, message: str) -> str:
    # Simulate external push delivery (replace with real push logic as needed)
    print(f"Pushed to {target}: {message}")
    detail = "Push delivered"

    # Log the push attempt to MongoDB
    await mongo_db.external_pushes.insert_one({
        "target": target,
        "message": message,
        "detail": detail,
    })

    return detail
