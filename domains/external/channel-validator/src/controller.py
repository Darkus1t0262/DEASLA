from fastapi import APIRouter
from src.models import ChannelValidationRequest, ChannelValidationResponse
from src.service import validate_channel

router = APIRouter()

@router.post("/", response_model=ChannelValidationResponse)
async def validate(request: ChannelValidationRequest):
    valid, detail = await validate_channel(request.channel, request.address)
    return ChannelValidationResponse(valid=valid, detail=detail)
