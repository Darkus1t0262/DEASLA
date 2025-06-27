from src.config import AsyncSessionLocal
from src.models import User
from sqlalchemy.future import select

async def execute_graphql(query: str) -> dict:
    # Only 'users' query supported in this simple example
    if "users" in query.lower():
        async with AsyncSessionLocal() as session:
            result = await session.execute(select(User))
            users = result.scalars().all()
            user_list = [{"id": user.id, "name": user.name} for user in users]
            return {"users": user_list}
    return {"ok": True}
