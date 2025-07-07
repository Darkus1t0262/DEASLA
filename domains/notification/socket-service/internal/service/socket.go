package service

import (
	"context"
	"socket-service/internal/db"
)

func BroadcastMessage(channel string, message string) error {
	ctx := context.Background()
	return db.RedisClient.Publish(ctx, channel, message).Err()
}
