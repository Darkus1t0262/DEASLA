from fastapi import APIRouter, HTTPException
from src.models import SMSRequest, SMSResponse
from src.service import send_sms

router = APIRouter()

@router.post("/send", response_model=SMSResponse)
def send_sms_endpoint(request: SMSRequest):
    try:
        result = send_sms(request.phone_number, request.message)
        if result:
            return SMSResponse(success=True, detail="SMS sent successfully.")
        else:
            return SMSResponse(success=False, detail="SMS sending failed.")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
