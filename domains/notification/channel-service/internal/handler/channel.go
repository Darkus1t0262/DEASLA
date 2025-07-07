package handler

import (
	"channel-service/internal/model"
	"channel-service/internal/service"
	"net/http"

	"github.com/gin-gonic/gin"
)

func Health(c *gin.Context) {
	c.JSON(http.StatusOK, gin.H{"status": "ok"})
}

func RouteChannel(c *gin.Context) {
	var req model.ChannelRequest
	if err := c.ShouldBindJSON(&req); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"success": false, "detail": err.Error()})
		return
	}
	routed := service.RouteMessage(req.ChannelType, req.Payload)
	resp := model.ChannelResponse{
		Success: true,
		Routed:  routed,
		Detail:  "Routed successfully",
	}
	c.JSON(http.StatusOK, resp)
}
