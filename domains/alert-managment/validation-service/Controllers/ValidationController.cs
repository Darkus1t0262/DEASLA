using Microsoft.AspNetCore.Mvc;
using ValidationService.Models;
using ValidationService.Repositories;

namespace ValidationService.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ValidationController : ControllerBase
    {
        private readonly ValidationResultRepository _repository;

        public ValidationController(ValidationResultRepository repository)
        {
            _repository = repository;
        }

        [HttpPost]
        public async Task<IActionResult> CreateValidation([FromBody] ValidationResult validationResult)
        {
            var result = await _repository.CreateValidationResultAsync(validationResult);
            return CreatedAtAction(nameof(GetValidationResultById), new { id = result.Id }, result);
        }

        [HttpGet]
        public async Task<IActionResult> GetAllValidationResults()
        {
            var results = await _repository.GetAllValidationResultsAsync();
            return Ok(results);
        }

        [HttpGet("{id}")]
        public async Task<IActionResult> GetValidationResultById(int id)
        {
            var result = await _repository.GetValidationResultByIdAsync(id);
            if (result == null)
            {
                return NotFound();
            }
            return Ok(result);
        }

        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteValidationResult(int id)
        {
            var deleted = await _repository.DeleteValidationResultAsync(id);
            if (!deleted)
            {
                return NotFound();
            }
            return NoContent();
        }
    }
}
