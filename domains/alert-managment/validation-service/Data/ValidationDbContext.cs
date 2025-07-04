using Microsoft.EntityFrameworkCore;
using ValidationService.Models;

namespace ValidationService.Data
{
    public class ValidationDbContext : DbContext
    {
        public ValidationDbContext(DbContextOptions<ValidationDbContext> options) : base(options) { }

        public DbSet<ValidationResult> ValidationResults { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            // Explicitly set the table name as lowercase to match PostgreSQL's case-sensitive behavior
            modelBuilder.Entity<ValidationResult>()
                .ToTable("validationresults");  // Ensure the correct table name in the database

            // Explicitly map model properties to the correct column names in PostgreSQL (lowercase)
            modelBuilder.Entity<ValidationResult>()
                .Property(v => v.Id)
                .HasColumnName("id");  // Map the 'Id' property to 'id' in PostgreSQL

            modelBuilder.Entity<ValidationResult>()
                .Property(v => v.AlertId)
                .HasColumnName("alertid");  // Map AlertId to the lowercase "alertid" column

            modelBuilder.Entity<ValidationResult>()
                .Property(v => v.ErrorMessage)
                .HasColumnName("errormessage");  // Map ErrorMessage to the lowercase "errormessage" column
            
            modelBuilder.Entity<ValidationResult>()
                .Property(v => v.IsValid)
                .HasColumnName("isvalid");  // Map IsValid to the lowercase "isvalid" column
            
            modelBuilder.Entity<ValidationResult>()
                .Property(v => v.Timestamp)
                .HasColumnName("timestamp");  // Map Timestamp to the lowercase "timestamp" column
        }
    }
}
