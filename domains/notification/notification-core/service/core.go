package service

func SendNotification(recipient, content string) bool {
    // Simulate notification logic
    println("Notification to", recipient, ":", content)
    return true
}
