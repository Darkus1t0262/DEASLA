from fastapi import APIRouter
from src.models import ChannelValidationRequest, ChannelValidationResponse
from src.service import validate_channel

router = APIRouter()

@router.post("/", response_model=ChannelValidationResponse)
def validate(request: ChannelValidationRequest):
    valid, detail = validate_channel(request.channel, request.address)
    return ChannelValidationResponse(valid=valid, detail=detail)
