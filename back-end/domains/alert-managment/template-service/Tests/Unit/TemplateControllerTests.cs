using Xunit;
using Moq;
using TemplateService.Controllers;
using TemplateService.Models;
using TemplateService.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;

public class TemplateControllerTests
{
    private readonly Mock<ITemplateService> _mockService;
    private readonly TemplateController _controller;

    public TemplateControllerTests()
    {
        _mockService = new Mock<ITemplateService>();
        _controller = new TemplateController(_mockService.Object);
    }

    [Fact]
    public async Task GetAll_ReturnsOk()
    {
        _mockService.Setup(s => s.GetAllAsync()).ReturnsAsync(new List<Template>());
        var result = await _controller.GetAll();
        Assert.IsType<OkObjectResult>(result);
    }
}
