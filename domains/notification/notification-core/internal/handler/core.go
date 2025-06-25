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

func SendNotification(c *gin.Context) {
    var req model.NotificationRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"success": false, "detail": err.Error()})
        return
    }
    ok := service.SendNotification(req.Recipient, req.Content)
    resp := model.NotificationResponse{
        Success: ok,
        Detail:  "Notification sent",
    }
    c.JSON(http.StatusOK, resp)
}
