package model

type BroadcastRequest struct {
    Message    string   `json:"message"`
    Recipients []string `json:"recipients"`
}

type BroadcastResponse struct {
    Success   bool   `json:"success"`
    Delivered int    `json:"delivered"`
    Detail    string `json:"detail"`
}
