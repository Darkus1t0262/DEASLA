from pydantic import BaseModel
from typing import List, Optional

class LogEntry(BaseModel):
    id: int
    timestamp: str
    service: str
    message: str

class LogRequest(BaseModel):
    service: str
    message: str

class LogResponse(BaseModel):
    success: bool
    log: Optional[LogEntry] = None

class LogListResponse(BaseModel):
    logs: List[LogEntry]
