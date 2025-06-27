from fastapi import APIRouter, HTTPException
from src.models import PushRequest, PushResponse
from src.service import send_push

router = APIRouter()

@router.post("/send", response_model=PushResponse)
def send_push_endpoint(request: PushRequest):
    try:
        result = send_push(request.device_id, request.title, request.body)
        if result:
            return PushResponse(success=True, detail="Push notification sent successfully.")
        else:
            return PushResponse(success=False, detail="Push notification failed.")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
