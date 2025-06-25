from fastapi import APIRouter
from src.models import LogRequest, LogResponse, LogListResponse
from src.service import save_log, get_logs

router = APIRouter()

@router.post("/", response_model=LogResponse)
def create_log(request: LogRequest):
    entry = save_log(request.service, request.message)
    return LogResponse(success=True, log=entry)

@router.get("/", response_model=LogListResponse)
def list_logs():
    logs = get_logs()
    return LogListResponse(logs=logs)
