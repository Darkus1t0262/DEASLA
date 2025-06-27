from dotenv import load_dotenv
import os
from pymongo import MongoClient

load_dotenv()

mongo_uri = f"mongodb://{os.environ['MONGO_USER']}:{os.environ['MONGO_PASSWORD']}@{os.environ['MONGO_HOST']}:{os.environ['MONGO_PORT']}/{os.environ['MONGO_DB']}"
client = MongoClient(mongo_uri)
db = client[os.environ['MONGO_DB']]

print("✅ Connected to MongoDB!")
