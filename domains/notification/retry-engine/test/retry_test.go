package test

import (
	"bytes"
	"encoding/json"
	"net/http"
	"net/http/httptest"
	"testing"

	"retry-engine/internal/handler"

	"github.com/gin-gonic/gin"
)

func TestRetryMessage(t *testing.T) {
	gin.SetMode(gin.TestMode)
	router := gin.Default()
	router.POST("/api/retry", handler.RetryMessage)

	body := map[string]interface{}{
		"message_id": "msg-42",
		"payload":    "Test payload",
	}
	jsonBody, _ := json.Marshal(body)
	req, _ := http.NewRequest("POST", "/api/retry", bytes.NewBuffer(jsonBody))
	req.Header.Set("Content-Type", "application/json")
	resp := httptest.NewRecorder()
	router.ServeHTTP(resp, req)

	if resp.Code != 200 {
		t.Fatalf("Expected 200, got %d", resp.Code)
	}
}
