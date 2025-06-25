package main

import (
    "github.com/gin-gonic/gin"
    "notification/internal/handler"
)

func main() {
    r := gin.Default()
    r.GET("/health", handler.Health)
    r.GET("/ws", handler.SocketHandler)
    r.Run(":4105")
}
