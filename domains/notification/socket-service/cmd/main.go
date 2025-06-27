package main

import (
	"socket-service/internal/db" // Import your db package
	"socket-service/internal/handler"

	"github.com/gin-gonic/gin"
)

func main() {
	db.InitRedis() // Initialize Redis connection at startup

	r := gin.Default()
	r.GET("/health", handler.Health)
	r.GET("/ws", handler.SocketHandler)
	r.Run(":4105")
}
