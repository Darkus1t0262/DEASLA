package main

import (
    "fmt"
    "net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
    fmt.Fprintf(w, "Hello from channel-service!")
}

func main() {
    http.HandleFunc("/", handler)
    fmt.Println("Starting channel-service on port 3000...")
    http.ListenAndServe(":3000", nil)
}
