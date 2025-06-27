package service

import (
    "context"
    "time"
    "notification/internal/db"
)

var ctx = context.Background()

func SendBroadcast(message string, recipients []string) int {
    now := time.Now().Format(time.RFC3339)
    for _, r := range recipients {
        key := "broadcast:" + r
        value := map[string]interface{}{
            "message":   message,
            "timestamp": now,
        }
        db.RedisClient.RPush(ctx, key, value)
    }
    return len(recipients)
}
