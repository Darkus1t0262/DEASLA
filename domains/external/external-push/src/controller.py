from fastapi import APIRouter
from src.models import ExternalPushRequest, ExternalPushResponse
from src.service import push_to_external

router = APIRouter()

@router.post("/", response_model=ExternalPushResponse)
async def external_push_endpoint(request: ExternalPushRequest):
    detail = await push_to_external(request.target, request.message)
    return ExternalPushResponse(success=True, detail=detail)
