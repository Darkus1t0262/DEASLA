package service

import "sync"

var retryDB = make(map[string]int)
var mu sync.Mutex

func AddRetry(messageID, payload string) (int, string) {
    mu.Lock()
    defer mu.Unlock()
    retryDB[messageID]++
    return retryDB[messageID], "retried"
}

func ListRetryStatuses() []map[string]interface{} {
    mu.Lock()
    defer mu.Unlock()
    var list []map[string]interface{}
    for mid, count := range retryDB {
        list = append(list, map[string]interface{}{
            "message_id": mid,
            "retries":    count,
            "status":     "retried",
        })
    }
    return list
}
