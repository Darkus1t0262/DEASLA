package test

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"broadcast-service/internal/handler"

	"github.com/gin-gonic/gin"
)

func TestSendBroadcast(t *testing.T) {
	gin.SetMode(gin.TestMode)
	router := gin.Default()
	router.POST("/api/broadcast/send", handler.SendBroadcast)

	body := map[string]interface{}{
		"message":    "Test Broadcast",
		"recipients": []string{"user1", "user2"},
	}
	jsonBody, _ := json.Marshal(body)
	req, _ := http.NewRequest("POST", "/api/broadcast/send", bytes.NewBuffer(jsonBody))
	req.Header.Set("Content-Type", "application/json")
	resp := httptest.NewRecorder()
	router.ServeHTTP(resp, req)

	if resp.Code != 200 {
		t.Fatalf("Expected 200, got %d", resp.Code)
	}
}
