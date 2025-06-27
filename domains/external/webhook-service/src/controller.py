from fastapi import APIRouter
from src.models import WebhookEvent, WebhookResponse
from src.service import handle_webhook

router = APIRouter()

@router.post("/", response_model=WebhookResponse)
async def webhook_endpoint(event: WebhookEvent):
    result = await handle_webhook(event.event_type, event.payload)
    return WebhookResponse(success=True, detail=result)
