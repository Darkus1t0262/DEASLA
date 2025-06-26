from dotenv import load_dotenv
import os
import redis

load_dotenv()

r = redis.Redis(
    host=os.environ['REDIS_HOST'],
    port=int(os.environ['REDIS_PORT'])
)
r.ping()
print("✅ Connected to Redis!")
