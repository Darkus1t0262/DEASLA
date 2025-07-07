from pydantic import BaseModel

class ChannelValidationRequest(BaseModel):
    channel: str
    address: str

class ChannelValidationResponse(BaseModel):
    valid: bool
    detail: str
