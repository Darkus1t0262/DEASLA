package test

import (
    "net/http/httptest"
    "testing"

    "github.com/gin-gonic/gin"
    "notification/internal/handler"
)

func TestHealth(t *testing.T) {
    gin.SetMode(gin.TestMode)
    router := gin.Default()
    router.GET("/health", handler.Health)
    w := httptest.NewRecorder()
    req := httptest.NewRequest("GET", "/health", nil)
    router.ServeHTTP(w, req)
    if w.Code != 200 {
        t.Fatalf("Expected 200, got %d", w.Code)
    }
}
