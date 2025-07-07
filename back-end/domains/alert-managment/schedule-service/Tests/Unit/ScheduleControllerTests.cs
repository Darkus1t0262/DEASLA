using Xunit;
using Moq;
using ScheduleService.Controllers;
using ScheduleService.Models;
using ScheduleService.Services;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System;
using System.Threading.Tasks;

public class ScheduleControllerTests
{
    private readonly Mock<IScheduleService> _mockService;
    private readonly ScheduleController _controller;

    public ScheduleControllerTests()
    {
        _mockService = new Mock<IScheduleService>();
        _controller = new ScheduleController(_mockService.Object);
    }

    [Fact]
    public async Task GetAll_ReturnsOk()
    {
        _mockService.Setup(s => s.GetAllAsync()).ReturnsAsync(new List<Schedule>());
        var result = await _controller.GetAll();
        Assert.IsType<OkObjectResult>(result);
    }

    [Fact]
    public async Task GetById_ReturnsNotFound_WhenNotExist()
    {
        _mockService.Setup(s => s.GetByIdAsync(It.IsAny<Guid>())).ReturnsAsync((Schedule)null);
        var result = await _controller.GetById(Guid.NewGuid());
        Assert.IsType<NotFoundResult>(result);
    }
}
