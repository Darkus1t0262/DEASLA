using Microsoft.Extensions.Configuration;
using MongoDB.Driver;
using TemplateService.Models;

namespace TemplateService.Data
{
    public class MongoContext
    {
        private readonly IMongoDatabase _db;

        public MongoContext(IConfiguration config)
        {
            var host = config["MongoSettings:Host"];
            var port = config["MongoSettings:Port"];
            var user = config["MongoSettings:User"];
            var password = config["MongoSettings:Password"];
            var dbName = config["MongoSettings:Database"];

            // Build the connection string
            var connection = $"mongodb://{user}:{password}@{host}:{port}";

            // Create MongoClientSettings and set the authentication mechanism
            var settings = MongoClientSettings.FromConnectionString(connection);

            // Specify the Authentication Mechanism through MongoCredential
            var credentials = MongoCredential.CreateCredential(
                dbName,    // Database name
                user,      // MongoDB user
                password   // MongoDB password
            );

            settings.Credentials = new[] { credentials };

            // Initialize the MongoClient with updated settings
            var client = new MongoClient(settings);
            _db = client.GetDatabase(dbName);  // Get the database
        }

        public IMongoCollection<Template> Templates => _db.GetCollection<Template>("templates");
    }
}
