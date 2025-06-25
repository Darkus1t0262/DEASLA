package main

import (
    "github.com/gin-gonic/gin"
    "notification/internal/handler"
)

func main() {
    r := gin.Default()
    r.GET("/health", handler.Health)
    r.POST("/api/retry", handler.RetryMessage)
    r.GET("/api/retry/status", handler.ListRetries)
    r.Run(":4104")
}
