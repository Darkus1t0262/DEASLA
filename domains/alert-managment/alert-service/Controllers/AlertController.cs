using AlertService.Models;
using AlertService.Services;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;

namespace AlertService.Controllers
{
    [ApiController]
    [Route("api/alerts")]
    public class AlertController : ControllerBase
    {
        private readonly AlertManagerService _alertService;

        /// <summary>
        /// Constructor with dependency injection for alert service.
        /// </summary>
        /// <param name="alertService">AlertManagerService instance</param>
        public AlertController(AlertManagerService alertService)
        {
            _alertService = alertService;
        }

        /// <summary>
        /// Retrieves all alerts from the system.
        /// </summary>
        /// <returns>List of alerts</returns>
        [HttpGet]
        public async Task<IActionResult> GetAll()
        {
            var alerts = await _alertService.GetAllAlerts();
            return Ok(alerts);
        }

        /// <summary>
        /// Creates a new alert entry.
        /// </summary>
        /// <param name="alert">Alert object to store</param>
        /// <returns>Created alert with assigned ID and timestamp</returns>
        [HttpPost]
        public async Task<IActionResult> Create([FromBody] Alert alert)
        {
            if (alert == null || string.IsNullOrWhiteSpace(alert.Message))
                return BadRequest("Alert must contain a valid message.");

            alert.Id = Guid.NewGuid();
            alert.CreatedAt = DateTime.UtcNow;

            var result = await _alertService.CreateAlert(alert);
            return CreatedAtAction(nameof(GetAll), new { id = result.Id }, result);
        }

        /// <summary>
        /// Verifies if the alert service is running.
        /// </summary>
        /// <returns>Status 200 OK with health message</returns>
        [HttpGet("health")]
        public IActionResult HealthCheck() => Ok("✅ Alert Service is running");
    }
}
