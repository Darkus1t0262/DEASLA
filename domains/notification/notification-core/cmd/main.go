package main

import (
    "github.com/gin-gonic/gin"
    "notification/internal/handler"
)

func main() {
    r := gin.Default()
    r.GET("/health", handler.Health)
    r.POST("/api/notification/send", handler.SendNotification)
    r.Run(":4103")
}
