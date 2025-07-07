using Xunit;
using Moq;
using AlertServiceApp.Controllers;
using AlertServiceApp.Models;
using AlertServiceApp.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Threading.Tasks;
using System;

public class AlertControllerTests
{
    private readonly Mock<AlertService> _mockService;
    private readonly AlertController _controller;

    public AlertControllerTests()
    {
        _mockService = new Mock<AlertService>(null, null);
        _controller = new AlertController(_mockService.Object);
    }

    [Fact]
    public async Task GetAll_ReturnsOkResult()
    {
        _mockService.Setup(s => s.GetAllAlerts()).ReturnsAsync(new List<Alert>());
        var result = await _controller.GetAll();
        Assert.IsType<OkObjectResult>(result);
    }

    [Fact]
    public async Task Create_ReturnsBadRequest_WhenAlertIsInvalid()
    {
        var result = await _controller.Create(null);
        Assert.IsType<BadRequestObjectResult>(result);
    }
}
