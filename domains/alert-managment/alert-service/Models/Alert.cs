using System;
using System.ComponentModel.DataAnnotations;

namespace AlertService.Models
{
    public class Alert
    {
        [Key]
        public Guid Id { get; set; } = Guid.NewGuid();

        [Required]
        public string Message { get; set; }

        public DateTime CreatedAt { get; set; } = DateTime.UtcNow;
    }
}
