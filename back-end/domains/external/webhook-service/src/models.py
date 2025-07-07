from pydantic import BaseModel
from sqlalchemy import Column, Integer, String, JSON, DateTime
from sqlalchemy.ext.declarative import declarative_base
from typing import Optional, Dict
import datetime

Base = declarative_base()

class WebhookLog(Base):
    __tablename__ = "webhook_logs"
    id = Column(Integer, primary_key=True, index=True)
    event_type = Column(String, index=True)
    payload = Column(JSON)
    received_at = Column(DateTime, default=datetime.datetime.utcnow)

class WebhookEvent(BaseModel):
    event_type: str
    payload: Dict[str, Optional[str]]

class WebhookResponse(BaseModel):
    success: bool
    detail: str
