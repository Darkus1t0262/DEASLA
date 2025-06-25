def handle_webhook(event_type: str, payload: dict) -> str:
    # Simulate processing a webhook event
    print(f"Received webhook: {event_type} with {payload}")
    return "Processed"
