from pydantic import BaseModel
from typing import Optional, Dict

class WebhookEvent(BaseModel):
    event_type: str
    payload: Dict[str, Optional[str]]

class WebhookResponse(BaseModel):
    success: bool
    detail: str
