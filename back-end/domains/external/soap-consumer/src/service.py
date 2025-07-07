from src.config import AsyncSessionLocal
from src.models import SoapLog
from sqlalchemy.future import select
from sqlalchemy import insert
import datetime

async def consume_soap(action: str, payload: dict) -> dict:
    # Simulate SOAP call
    if action == "GetInfo":
        result = {"result": "Sample SOAP info"}
    else:
        result = {"ok": True}

    # Log the SOAP action to Postgres
    async with AsyncSessionLocal() as session:
        stmt = insert(SoapLog).values(
            action=action,
            payload=payload,
            response=result,
            timestamp=datetime.datetime.utcnow()
        )
        await session.execute(stmt)
        await session.commit()

    return result
