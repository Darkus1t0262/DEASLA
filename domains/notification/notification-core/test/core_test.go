package test

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"notification-core/internal/handler"

	"github.com/gin-gonic/gin"
)

func TestSendNotification(t *testing.T) {
	gin.SetMode(gin.TestMode)
	router := gin.Default()
	router.POST("/api/notification/send", handler.SendNotification)

	body := map[string]interface{}{
		"recipient": "user1",
		"content":   "Test Notification",
	}
	jsonBody, _ := json.Marshal(body)
	req, _ := http.NewRequest("POST", "/api/notification/send", bytes.NewBuffer(jsonBody))
	req.Header.Set("Content-Type", "application/json")
	resp := httptest.NewRecorder()
	router.ServeHTTP(resp, req)

	if resp.Code != 200 {
		t.Fatalf("Expected 200, got %d", resp.Code)
	}
}
