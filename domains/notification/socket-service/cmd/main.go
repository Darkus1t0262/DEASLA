package main

import (
	"socket-service/internal/db"      // Redis init
	"socket-service/internal/handler" // WebSocket + health

	"github.com/gin-gonic/gin"
	"github.com/prometheus/client_golang/prometheus"
	"github.com/prometheus/client_golang/prometheus/promhttp"
)

// Custom metric: total websocket connections
var socketConnections = prometheus.NewCounter(prometheus.CounterOpts{
	Name: "socket_connections_total",
	Help: "Total WebSocket connections established",
})

func init() {
	// Register metric
	prometheus.MustRegister(socketConnections)
}

func main() {
	db.InitRedis() // Redis init

	r := gin.Default()

	// Prometheus metrics endpoint
	r.GET("/metrics", gin.WrapH(promhttp.Handler()))

	// Health check
	r.GET("/health", handler.Health)

	// WebSocket endpoint
	r.GET("/ws", func(c *gin.Context) {
		socketConnections.Inc() // Count each connection
		handler.SocketHandler(c)
	})

	r.Run(":4105")
}
