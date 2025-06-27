package test

import (
    "bytes"
    "encoding/json"
    "net/http"
    "net/http/httptest"
    "testing"

    "github.com/gin-gonic/gin"
    "notification/internal/handler"
)

func TestRouteChannel(t *testing.T) {
    gin.SetMode(gin.TestMode)
    router := gin.Default()
    router.POST("/api/channel/route", handler.RouteChannel)

    body := map[string]interface{}{
        "channel_type": "email",
        "payload":      "Test message",
    }
    jsonBody, _ := json.Marshal(body)
    req, _ := http.NewRequest("POST", "/api/channel/route", bytes.NewBuffer(jsonBody))
    req.Header.Set("Content-Type", "application/json")
    resp := httptest.NewRecorder()
    router.ServeHTTP(resp, req)

    if resp.Code != 200 {
        t.Fatalf("Expected 200, got %d", resp.Code)
    }
}
