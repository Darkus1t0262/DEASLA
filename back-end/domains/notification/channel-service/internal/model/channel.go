package model

type ChannelRequest struct {
    ChannelType string `json:"channel_type"`
    Payload     string `json:"payload"`
}

type ChannelResponse struct {
    Success bool   `json:"success"`
    Routed  string `json:"routed"`
    Detail  string `json:"detail"`
}
