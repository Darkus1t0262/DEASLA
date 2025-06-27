package main

import (
    "github.com/gin-gonic/gin"
    "notification/internal/handler"
    "notification/internal/db" // Import your db package
)

func main() {
    db.InitRedis() // Initialize Redis connection at startup

    r := gin.Default()
    r.GET("/health", handler.Health)
    r.GET("/ws", handler.SocketHandler)
    r.Run(":4105")
}
