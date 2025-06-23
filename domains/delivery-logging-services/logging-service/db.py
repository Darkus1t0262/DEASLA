from pymongo import MongoClient
import os

MONGO_HOST = os.getenv("MONGO_HOST", "mongo")
MONGO_PORT = int(os.getenv("MONGO_PORT", "27017"))
MONGO_DB = os.getenv("MONGO_DB", "deasla_mongo")

client = MongoClient(host=MONGO_HOST, port=MONGO_PORT)
db = client[MONGO_DB]

print("✅ Connected to MongoDB")
