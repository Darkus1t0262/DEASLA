from fastapi import APIRouter
from src.models import SoapRequest, SoapResponse
from src.service import consume_soap

router = APIRouter()

@router.post("/", response_model=SoapResponse)
def soap_endpoint(request: SoapRequest):
    data = consume_soap(request.action, request.payload)
    return SoapResponse(success=True, detail="SOAP action processed", data=data)
