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
    retries, err := service.AddRetry(req.MessageID, req.Payload)
    if err != nil {
        c.JSON(http.StatusInternalServerError, gin.H{"success": false, "detail": err.Error()})
        return
    }
    resp := model.RetryResponse{
        Success: true,
        Retries: retries,
        Detail:  "Message retried",
    }
    c.JSON(http.StatusOK, resp)
}

func ListRetries(c *gin.Context) {
    statuses, err := service.ListRetryStatuses()
    if err != nil {
        c.JSON(http.StatusInternalServerError, gin.H{"success": false, "detail": err.Error()})
        return
    }
    c.JSON(http.StatusOK, gin.H{"success": true, "statuses": statuses})
}
