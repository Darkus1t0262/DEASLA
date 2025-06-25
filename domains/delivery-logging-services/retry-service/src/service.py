from src.models import RetryStatus

_retry_db = {}

def add_retry(message_id: str, payload: dict) -> RetryStatus:
    status = _retry_db.get(message_id, {"retries": 0, "status": "pending"})
    status["retries"] += 1
    status["status"] = "retried"
    _retry_db[message_id] = status
    return RetryStatus(message_id=message_id, retries=status["retries"], status=status["status"])

def get_retries() -> list:
    return [RetryStatus(message_id=mid, retries=info["retries"], status=info["status"]) for mid, info in _retry_db.items()]
