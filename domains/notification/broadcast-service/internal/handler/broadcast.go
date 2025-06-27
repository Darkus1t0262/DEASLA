package handler

import (
    "net/http"
    "notification/internal/model"
    "notification/internal/service"
    "github.com/gin-gonic/gin"
)

func Health(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{"status": "ok"})
}

func SendBroadcast(c *gin.Context) {
    var req model.BroadcastRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"success": false, "detail": err.Error()})
        return
    }
    delivered := service.SendBroadcast(req.Message, req.Recipients)
    resp := model.BroadcastResponse{
        Success:   true,
        Delivered: delivered,
        Detail:    "Broadcast sent to recipients",
    }
    c.JSON(http.StatusOK, resp)
}
