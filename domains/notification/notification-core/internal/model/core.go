package model

type NotificationRequest struct {
    Recipient string `json:"recipient"`
    Content   string `json:"content"`
}

type NotificationResponse struct {
    Success bool   `json:"success"`
    Detail  string `json:"detail"`
}
