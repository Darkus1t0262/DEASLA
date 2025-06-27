package main

import (
    "github.com/gin-gonic/gin"
    "notification/internal/handler"
    "notification/internal/db" // <-- new import
)

func main() {
    db.InitRedis() // <-- initialize Redis once at startup

    r := gin.Default()
    r.GET("/health", handler.Health)
    r.POST("/api/broadcast/send", handler.SendBroadcast)
    r.Run(":4101")
}
