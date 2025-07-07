from pydantic import BaseModel

class PushRequest(BaseModel):
    device_id: str
    title: str
    body: str

class PushResponse(BaseModel):
    success: bool
    detail: str = ""
