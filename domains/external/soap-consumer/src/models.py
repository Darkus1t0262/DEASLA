from pydantic import BaseModel
from sqlalchemy import Column, Integer, String, JSON, DateTime
from sqlalchemy.ext.declarative import declarative_base
import datetime

Base = declarative_base()

class SoapLog(Base):
    __tablename__ = "soap_logs"
    id = Column(Integer, primary_key=True, index=True)
    action = Column(String, index=True)
    payload = Column(JSON)
    response = Column(JSON)
    timestamp = Column(DateTime, default=datetime.datetime.utcnow)

class SoapRequest(BaseModel):
    action: str
    payload: dict

class SoapResponse(BaseModel):
    success: bool
    detail: str
    data: dict = {}
