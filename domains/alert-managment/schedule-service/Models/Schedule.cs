using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace ScheduleService.Models // ✅ Add this wrapper
{
    public class Schedule
    {
        [Key]
        [Column("Id")]
        public long Id { get; set; }

        [Column("alert_title")]
        public string Description { get; set; } = string.Empty;

        [Column("scheduled_at")]
        public DateTime ScheduledTime { get; set; }

        [Column("status")]
        public string? Status { get; set; }
    }
}
