namespace ValidationService.Models
{
    public class ValidationResult
    {
        public int Id { get; set; }
        public string AlertId { get; set; }
        public bool IsValid { get; set; }
        public string ErrorMessage { get; set; }
        public DateTime Timestamp { get; set; }
    }
}
