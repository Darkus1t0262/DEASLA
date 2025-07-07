from fastapi import APIRouter, HTTPException
from src.models import LogRequest, LogResponse, LogListResponse
from src.service import save_log, get_logs

router = APIRouter(prefix="/logs", tags=["Logs"])

@router.post("/", response_model=LogResponse)
def create_log(request: LogRequest):
    try:
        entry = save_log(request.service, request.message)
        return LogResponse(success=True, log=entry)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@router.get("/", response_model=LogListResponse)
def list_logs():
    try:
        logs = get_logs()
        return LogListResponse(logs=logs)
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))
