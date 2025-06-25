from pydantic import BaseModel
from typing import List

class RetryRequest(BaseModel):
    message_id: str
    payload: dict

class RetryResponse(BaseModel):
    success: bool
    detail: str = ""

class RetryStatus(BaseModel):
    message_id: str
    retries: int
    status: str

class RetryListResponse(BaseModel):
    statuses: List[RetryStatus]
