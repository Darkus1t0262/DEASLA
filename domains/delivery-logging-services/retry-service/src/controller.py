from fastapi import APIRouter
from src.models import RetryRequest, RetryResponse, RetryListResponse
from src.service import add_retry, get_retries

router = APIRouter()

@router.post("/", response_model=RetryResponse)
def retry_message(request: RetryRequest):
    status = add_retry(request.message_id, request.payload)
    return RetryResponse(success=True, detail=f"Message {status.message_id} retried {status.retries} times.")

@router.get("/", response_model=RetryListResponse)
def list_retries():
    statuses = get_retries()
    return RetryListResponse(statuses=statuses)
