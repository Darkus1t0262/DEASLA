from pydantic import BaseModel

class ExternalPushRequest(BaseModel):
    target: str
    message: str

class ExternalPushResponse(BaseModel):
    success: bool
    detail: str
