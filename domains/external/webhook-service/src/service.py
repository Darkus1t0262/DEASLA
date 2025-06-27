from src.config import AsyncSessionLocal
from src.models import WebhookLog
from sqlalchemy import insert
import datetime

async def handle_webhook(event_type: str, payload: dict) -> str:
    # Simulate processing webhook event
    print(f"Received webhook: {event_type} with {payload}")
    detail = "Processed"

    # Log webhook event to Postgres
    async with AsyncSessionLocal() as session:
        stmt = insert(WebhookLog).values(
            event_type=event_type,
            payload=payload,
            received_at=datetime.datetime.utcnow()
        )
        await session.execute(stmt)
        await session.commit()

    return detail
