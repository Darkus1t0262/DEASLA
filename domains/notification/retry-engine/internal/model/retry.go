package model

type RetryRequest struct {
    MessageID string `json:"message_id"`
    Payload   string `json:"payload"`
}

type RetryResponse struct {
    Success   bool   `json:"success"`
    Retries   int    `json:"retries"`
    Detail    string `json:"detail"`
}

type RetryStatus struct {
    MessageID string `json:"message_id"`
    Retries   int    `json:"retries"`
    Status    string `json:"status"`
}
