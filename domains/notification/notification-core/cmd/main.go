package main

import (
    "log"
    "github.com/gin-gonic/gin"
    "notification/internal/handler"
    "notification/internal/db" // Import your db package
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
