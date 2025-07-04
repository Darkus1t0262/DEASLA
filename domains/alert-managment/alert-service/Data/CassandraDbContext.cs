using Cassandra;
using Microsoft.Extensions.Configuration;

namespace AlertService.Data
{
    public class CassandraDbContext
    {
        public Cassandra.ISession Session { get; private set; }

        public CassandraDbContext(IConfiguration configuration)
        {
            var clusterBuilder = Cluster.Builder()
                .AddContactPoint(configuration["Cassandra:Host"])
                .WithPort(int.Parse(configuration["Cassandra:Port"]));

            // Optional: remove if your Cassandra container doesn’t require credentials
            var username = configuration["Cassandra:Username"];
            var password = configuration["Cassandra:Password"];
            if (!string.IsNullOrEmpty(username) && !string.IsNullOrEmpty(password))
            {
                clusterBuilder = clusterBuilder.WithCredentials(username, password);
            }

            var cluster = clusterBuilder.Build();

            // ✅ Connect explicitly to the keyspace
            Session = cluster.Connect(configuration["Cassandra:Keyspace"]);
        }
    }
}
