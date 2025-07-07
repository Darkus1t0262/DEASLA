package service

import (
	"channel-service/internal/db"
	"context"
	"fmt"
	"time"
)

// RouteMessage saves each message in a Redis list for the given channel type.
func RouteMessage(channelType, payload string) string {
	ctx := context.Background()
	timestamp := time.Now().Format(time.RFC3339)

	// Store the payload and timestamp in a Redis list per channel type
	value := fmt.Sprintf("[%s] %s", timestamp, payload)
	key := "channel:" + channelType

	// Push to Redis list (LPUSH for most recent first)
	err := db.RedisClient.LPush(ctx, key, value).Err()
	if err != nil {
		return "Failed to route message: " + err.Error()
	}
	return "Message routed to channel: " + channelType
}
