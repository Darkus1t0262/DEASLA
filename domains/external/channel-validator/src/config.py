from motor.motor_asyncio import AsyncIOMotorClient
import os

MONGODB_URI = os.getenv("MONGODB_URI", "mongodb://mongo:27017")
MONGODB_DB = os.getenv("MONGODB_DB", "deasla")

mongo_client = AsyncIOMotorClient(MONGODB_URI)
mongo_db = mongo_client[MONGODB_DB]
