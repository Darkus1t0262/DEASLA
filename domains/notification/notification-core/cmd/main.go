package main

import (
	"log"
	"notification-core/internal/db" // Import your db package
	"notification-core/internal/handler"

	"github.com/gin-gonic/gin"
)

func main() {
	// Initialize Postgres connection pool
	if err := db.InitPostgres(); err != nil {
		log.Fatalf("Failed to initialize Postgres: %v", err)
	}
	defer db.PgPool.Close()

	r := gin.Default()
	r.GET("/health", handler.Health)
	r.POST("/api/notification/send", handler.SendNotification)
	r.Run(":4103")
}
