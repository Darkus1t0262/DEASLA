package main

import (
	"retry-engine/internal/db" // Import your db package
	"retry-engine/internal/handler"

	"github.com/gin-gonic/gin"
)

func main() {
	db.InitRedis() // Initialize Redis connection pool at startup

	r := gin.Default()
	r.GET("/health", handler.Health)
	r.POST("/api/retry", handler.RetryMessage)
	r.GET("/api/retry/status", handler.ListRetries)
	r.Run(":4104")
}
