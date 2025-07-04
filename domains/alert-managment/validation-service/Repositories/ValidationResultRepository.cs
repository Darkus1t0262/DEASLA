using Microsoft.EntityFrameworkCore;
using ValidationService.Models;
using ValidationService.Data;

namespace ValidationService.Repositories
{
    public class ValidationResultRepository
    {
        private readonly ValidationDbContext _context;

        public ValidationResultRepository(ValidationDbContext context)
        {
            _context = context;
        }

        public async Task<List<ValidationResult>> GetAllValidationResultsAsync()
        {
            return await _context.ValidationResults.ToListAsync();
        }

        public async Task<ValidationResult> GetValidationResultByIdAsync(int id)
        {
            return await _context.ValidationResults.FindAsync(id);
        }

        public async Task<ValidationResult> CreateValidationResultAsync(ValidationResult validationResult)
        {
            // Ensure the Timestamp is set to UTC
            validationResult.Timestamp = DateTime.UtcNow;  // Ensure UTC time

            _context.ValidationResults.Add(validationResult);
            await _context.SaveChangesAsync();
            return validationResult;
        }

        public async Task<bool> DeleteValidationResultAsync(int id)
        {
            var validationResult = await _context.ValidationResults.FindAsync(id);
            if (validationResult == null) return false;

            _context.ValidationResults.Remove(validationResult);
            await _context.SaveChangesAsync();
            return true;
        }
    }
}
