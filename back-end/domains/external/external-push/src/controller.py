from fastapi import APIRouter
from prometheus_client import Counter
from src.models import ExternalPushRequest, ExternalPushResponse
from src.service import push_to_external

router = APIRouter()

# 📈 Custom counters
push_success_total = Counter("push_success_total", "Number of successful push notifications")
push_failure_total = Counter("push_failure_total", "Number of failed push notifications")

@router.post("/", response_model=ExternalPushResponse)
async def external_push_endpoint(request: ExternalPushRequest):
    try:
        detail = await push_to_external(request.target, request.message)
        push_success_total.inc()
        return ExternalPushResponse(success=True, detail=detail)
    except Exception as e:
        push_failure_total.inc()
        raise e
