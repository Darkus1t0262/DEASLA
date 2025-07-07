using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using TemplateService.Data;
using TemplateService.Services;

namespace TemplateService
{
    public class Startup
    {
        public IConfiguration Configuration { get; }

        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public void ConfigureServices(IServiceCollection services)
        {
            // Register configuration
            services.Configure<MongoSettings>(Configuration.GetSection("MongoSettings"));

            // Add services
            services.AddSingleton<MongoContext>();
            services.AddScoped<ITemplateService, TemplateServiceImpl>();

            // Add controllers and Swagger
            services.AddControllers();
            services.AddEndpointsApiExplorer();
            services.AddSwaggerGen();
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(c =>
                {
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "Template Service API V1");
                    c.RoutePrefix = string.Empty; // Serve Swagger at root
                });
            }

            app.UseRouting();

            app.UseAuthorization(); // Optional: if you have auth later

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }

    // Helper class for strongly-typed config (optional)
    public class MongoSettings
    {
        public string Host { get; set; }
        public string Port { get; set; }
        public string User { get; set; }
        public string Password { get; set; }
        public string Database { get; set; }
    }
}
