package handler

import (
    "net/http"
    "github.com/gin-gonic/gin"
    "github.com/gorilla/websocket"
    "notification/internal/db"
    "context"
    "log"
    "time"
)

var upgrader = websocket.Upgrader{
    CheckOrigin: func(r *http.Request) bool { return true },
}

func Health(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{"status": "ok"})
}

// Broadcast channel name
const wsChannel = "ws:broadcast"

func SocketHandler(c *gin.Context) {
    ws, err := upgrader.Upgrade(c.Writer, c.Request, nil)
    if err != nil {
        log.Printf("Upgrade error: %v", err)
        return
    }
    defer ws.Close()

    ctx := context.Background()
    pubsub := db.RedisClient.Subscribe(ctx, wsChannel)
    defer pubsub.Close()

    // Listen to Redis Pub/Sub in a goroutine
    done := make(chan struct{})
    go func() {
        for msg := range pubsub.Channel() {
            // Forward Redis-broadcasted messages to this client
            ws.SetWriteDeadline(time.Now().Add(10 * time.Second))
            ws.WriteMessage(websocket.TextMessage, []byte(msg.Payload))
        }
        close(done)
    }()

    // Read messages from WebSocket client and publish to Redis
    for {
        mt, msg, err := ws.ReadMessage()
        if err != nil {
            break
        }
        log.Printf("Received: %s", msg)
        // Publish to all subscribers (all connected WebSockets)
        db.RedisClient.Publish(ctx, wsChannel, msg)
        // Optionally, echo back to sender
        ws.WriteMessage(mt, msg)
    }

    pubsub.Close()
    <-done
}
