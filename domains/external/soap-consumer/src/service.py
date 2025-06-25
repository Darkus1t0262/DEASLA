def consume_soap(action: str, payload: dict) -> dict:
    # Simulate SOAP call
    if action == "GetInfo":
        return {"result": "Sample SOAP info"}
    return {"ok": True}
