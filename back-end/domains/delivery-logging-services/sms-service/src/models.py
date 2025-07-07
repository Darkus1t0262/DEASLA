from pydantic import BaseModel

class SMSRequest(BaseModel):
    phone_number: str
    message: str

class SMSResponse(BaseModel):
    success: bool
    detail: str = ""
