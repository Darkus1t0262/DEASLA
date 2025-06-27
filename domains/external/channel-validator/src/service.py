from src.config import mongo_db

async def validate_channel(channel: str, address: str) -> (bool, str):
    if channel == "email" and "@" in address:
        valid, detail = True, "Valid email address."
    elif channel == "sms" and address.startswith("+"):
        valid, detail = True, "Valid phone number."
    else:
        valid, detail = False, "Invalid address for the given channel."

    # Log validation attempt to MongoDB
    await mongo_db.validations.insert_one({
        "channel": channel,
        "address": address,
        "valid": valid,
        "detail": detail,
    })
    return valid, detail
