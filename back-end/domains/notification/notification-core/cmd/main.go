package main

import (
	"log"
	"os"

	"notification-core/internal/db"
	"notification-core/internal/handler"

	"github.com/gin-gonic/gin"
)

func main() {
	log.Println("🔌 Connecting to PostgreSQL at:", os.Getenv("POSTGRES_HOST"))

	if err := db.InitPostgres(); err != nil {
		log.Fatalf("❌ Failed to connect to Postgres: %v", err)
	}
	defer db.PgPool.Close()

	r := gin.Default()
	r.GET("/health", handler.Health)
	r.POST("/api/notification/send", handler.SendNotification)

	log.Println("🚀 Notification Core running on port 4103")
	if err := r.Run(":4103"); err != nil {
		log.Fatalf("❌ Failed to start server: %v", err)
	}
}
