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

            var connection = $"mongodb://{user}:{password}@{host}:{port}";
            var client = new MongoClient(connection);
            _db = client.GetDatabase(dbName);
        }

        public IMongoCollection<Template> Templates => _db.GetCollection<Template>("templates");
    }
}
