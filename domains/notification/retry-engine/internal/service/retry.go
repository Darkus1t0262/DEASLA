package service

import (
    "context"
    "notification/internal/db"
    "notification/internal/model"
    "fmt"
    "strconv"
)

var ctx = context.Background()

// AddRetry increments the retry count in Redis for a message ID and stores the payload (optional).
func AddRetry(messageID, payload string) (int, error) {
    // Use Redis INCR to increment retry count
    count, err := db.RedisClient.Incr(ctx, "retry:count:"+messageID).Result()
    if err != nil {
        return 0, fmt.Errorf("failed to increment retry count: %w", err)
    }
    // Optionally, store/update the payload for that message
    err = db.RedisClient.Set(ctx, "retry:payload:"+messageID, payload, 0).Err()
    if err != nil {
        return int(count), fmt.Errorf("failed to store payload: %w", err)
    }
    return int(count), nil
}

// ListRetryStatuses returns the status for all retried messages
func ListRetryStatuses() ([]model.RetryStatus, error) {
    // Scan keys matching "retry:count:*"
    keys, err := db.RedisClient.Keys(ctx, "retry:count:*").Result()
    if err != nil {
        return nil, fmt.Errorf("failed to scan retry keys: %w", err)
    }

    var statuses []model.RetryStatus
    for _, key := range keys {
        messageID := key[len("retry:count:"):]
        countStr, err := db.RedisClient.Get(ctx, key).Result()
        if err != nil {
            continue // skip if error
        }
        count, _ := strconv.Atoi(countStr)
        status := model.RetryStatus{
            MessageID: messageID,
            Retries:   count,
            Status:    "retried",
        }
        statuses = append(statuses, status)
    }
    return statuses, nil
}
