package main

import (
	"broadcast-service/internal/db" // <-- new import
	"broadcast-service/internal/handler"

	"github.com/gin-gonic/gin"
)

func main() {
	db.InitRedis() // <-- initialize Redis once at startup

	r := gin.Default()
	r.GET("/health", handler.Health)
	r.POST("/api/broadcast/send", handler.SendBroadcast)
	r.Run(":4101")
}
