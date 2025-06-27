package db

import (
    "os"
    "github.com/redis/go-redis/v9"
)

var RedisClient *redis.Client

func InitRedis() {
    addr := os.Getenv("REDIS_ADDR")
    if addr == "" {
        addr = "redis:6379"
    }
    password := os.Getenv("REDIS_PASSWORD")
    db := 0
    RedisClient = redis.NewClient(&redis.Options{
        Addr:     addr,
        Password: password,
        DB:       db,
    })
}
