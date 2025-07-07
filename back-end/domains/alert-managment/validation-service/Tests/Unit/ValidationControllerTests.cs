using Xunit;
using Moq;
using ValidationService.Controllers;
using ValidationService.Models;
using ValidationService.Repositories;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

public class ValidationControllerTests
{
    private readonly Mock<ValidationResultRepository> _mockRepo;
    private readonly ValidationController _controller;

    public ValidationControllerTests()
    {
        _mockRepo = new Mock<ValidationResultRepository>(null);
        _controller = new ValidationController(_mockRepo.Object);
    }

    [Fact]
    public async Task GetAll_ReturnsOk()
    {
        _mockRepo.Setup(r => r.GetAllValidationResultsAsync()).ReturnsAsync(new List<ValidationResult>());
        var result = await _controller.GetAllValidationResults();
        Assert.IsType<OkObjectResult>(result);
    }
}
