package main

import (
  "context"
  "fmt"
  "github.com/redis/go-redis/v9"
  "os"
)

var ctx = context.Background()

func ConnectRedis() *redis.Client {
  rdb := redis.NewClient(&redis.Options{
    Addr:     fmt.Sprintf("%s:%s", os.Getenv("REDIS_HOST"), os.Getenv("REDIS_PORT")),
    Password: "",
    DB:       0,
  })

  _, err := rdb.Ping(ctx).Result()
  if err != nil {
    panic(err)
  }

  fmt.Println("✅ Connected to Redis")
  return rdb
}
