def validate_channel(channel: str, address: str) -> (bool, str):
    # Dummy: Accepts emails with '@', phone numbers with '+'
    if channel == "email" and "@" in address:
        return True, "Valid email address."
    if channel == "sms" and address.startswith("+"):
        return True, "Valid phone number."
    return False, "Invalid address for the given channel."
