from pydantic import BaseModel

class SoapRequest(BaseModel):
    action: str
    payload: dict

class SoapResponse(BaseModel):
    success: bool
    detail: str
    data: dict = {}
