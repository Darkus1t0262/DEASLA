package handler

import (
	"net/http"
	"notification-core/internal/model"
	"notification-core/internal/service"

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
	err := service.SendNotification(req.Recipient, req.Content)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{
			"success": false,
			"detail":  "Failed to send notification: " + err.Error(),
		})
		return
	}
	resp := model.NotificationResponse{
		Success: true,
		Detail:  "Notification sent",
	}
	c.JSON(http.StatusOK, resp)
}
