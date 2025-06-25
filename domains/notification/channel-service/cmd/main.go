package main

import (
    "github.com/gin-gonic/gin"
    "notification/internal/handler"
)

func main() {
    r := gin.Default()
    r.GET("/health", handler.Health)
    r.POST("/api/channel/route", handler.RouteChannel)
    r.Run(":4102")
}
