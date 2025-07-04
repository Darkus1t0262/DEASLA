using AlertService.Data;
using AlertService.Services;
using Microsoft.AspNetCore.Builder;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.OpenApi.Models;

var builder = WebApplication.CreateBuilder(args);

// Add services
builder.Services.AddControllers();
builder.Services.AddSingleton<CassandraDbContext>();
builder.Services.AddSingleton(sp => sp.GetRequiredService<CassandraDbContext>().Session);
builder.Services.AddScoped<AlertManagerService>();

// Add Swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen(options =>
{
    options.SwaggerDoc("v1", new OpenApiInfo
    {
        Title = "Alert Service API",
        Version = "v1",
        Description = "REST API for managing emergency alerts in DEAS-LA.",
        Contact = new OpenApiContact
        {
            Name = "DEAS-LA Dev Team",
            Email = "support@deasla.org"
        }
    });
});

var app = builder.Build();

// Middleware
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI(c =>
    {
        c.SwaggerEndpoint("/swagger/v1/swagger.json", "Alert Service API v1");
    });
}

app.UseAuthorization();
app.MapControllers();

app.Run();
