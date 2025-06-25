from fastapi import APIRouter, HTTPException
from src.models import EmailRequest, EmailResponse
from src.service import send_email

router = APIRouter()

@router.post("/send", response_model=EmailResponse)
def send_email_endpoint(request: EmailRequest):
    try:
        result = send_email(request.to, request.subject, request.body)
        if result:
            return EmailResponse(success=True, detail="Email sent successfully.")
        else:
            return EmailResponse(success=False, detail="Email sending failed.")
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
