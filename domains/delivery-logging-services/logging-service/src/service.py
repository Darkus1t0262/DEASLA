from datetime import datetime
from src.models import LogEntry

_logs = []
_next_id = 1

def save_log(service: str, message: str) -> LogEntry:
    global _next_id
    entry = LogEntry(
        id=_next_id,
        timestamp=datetime.utcnow().isoformat(),
        service=service,
        message=message
    )
    _logs.append(entry)
    _next_id += 1
    return entry

def get_logs() -> list:
    return _logs
