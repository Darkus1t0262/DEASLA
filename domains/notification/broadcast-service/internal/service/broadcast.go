package service

func SendBroadcast(message string, recipients []string) int {
    // Simulate sending (log to console)
    for _, r := range recipients {
        println("Broadcast to", r, ":", message)
    }
    return len(recipients)
}
