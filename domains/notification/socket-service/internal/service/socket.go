package service

import (
    "context"
    "notification/internal/db"
)

func BroadcastMessage(channel string, message string) error {
    ctx := context.Background()
    return db.RedisClient.Publish(ctx, channel, message).Err()
}
