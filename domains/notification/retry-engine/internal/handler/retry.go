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

func RetryMessage(c *gin.Context) {
    var req model.RetryRequest
    if err := c.ShouldBindJSON(&req); err != nil {
        c.JSON(http.StatusBadRequest, gin.H{"success": false, "detail": err.Error()})
        return
    }
    retries, _ := service.AddRetry(req.MessageID, req.Payload)
    resp := model.RetryResponse{
        Success: true,
        Retries: retries,
        Detail:  "Message retried",
    }
    c.JSON(http.StatusOK, resp)
}

func ListRetries(c *gin.Context) {
    statuses := service.ListRetryStatuses()
    c.JSON(http.StatusOK, gin.H{"statuses": statuses})
}
