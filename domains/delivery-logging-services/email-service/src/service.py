def send_email(to: str, subject: str, body: str) -> bool:
    # Integrate with a real email gateway here (e.g., SMTP, SendGrid, etc.)
    print(f"Sending email to {to} | Subject: {subject}\n{body}")
    return True
