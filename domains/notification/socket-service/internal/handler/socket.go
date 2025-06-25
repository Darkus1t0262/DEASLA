package handler

import (
    "net/http"
    "github.com/gin-gonic/gin"
    "github.com/gorilla/websocket"
    "log"
)

var upgrader = websocket.Upgrader{
    CheckOrigin: func(r *http.Request) bool {
        return true
    },
}

func Health(c *gin.Context) {
    c.JSON(http.StatusOK, gin.H{"status": "ok"})
}

// Simple WebSocket echo handler
func SocketHandler(c *gin.Context) {
    ws, err := upgrader.Upgrade(c.Writer, c.Request, nil)
    if err != nil {
        log.Printf("Upgrade error: %v", err)
        return
    }
    defer ws.Close()
    for {
        mt, msg, err := ws.ReadMessage()
        if err != nil {
            break
        }
        log.Printf("Received: %s", msg)
        // Echo message
        ws.WriteMessage(mt, msg)
    }
}
