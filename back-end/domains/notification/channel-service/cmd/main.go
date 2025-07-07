package main

import (
	"channel-service/internal/handler"

	"github.com/gin-gonic/gin"
)

func main() {
	r := gin.Default()
	r.GET("/health", handler.Health)
	r.POST("/api/channel/route", handler.RouteChannel)
	r.Run(":4102")
}
