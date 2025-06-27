package service

import (
    "context"
    "notification/internal/db"
)

func SendNotification(recipient, content string) error {
    // Save notification in the database
    _, err := db.PgPool.Exec(
        context.Background(),
        "INSERT INTO notifications (recipient, content) VALUES ($1, $2)",
        recipient, content,
    )
    return err
}
