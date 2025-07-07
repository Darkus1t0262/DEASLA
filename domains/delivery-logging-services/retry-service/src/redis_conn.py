from dotenv import load_dotenv
import os
import redis

load_dotenv()

redis_client = redis.Redis(
    host=os.environ['REDIS_HOST'],
    port=int(os.environ['REDIS_PORT'])
)

# Test de conexión opcional (puede dejarse o comentarse en producción)
redis_client.ping()
print("✅ Connected to Redis!")
