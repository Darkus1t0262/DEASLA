using Cassandra;
using Microsoft.Extensions.Configuration;

namespace AlertService.Data
{
    public class CassandraDbContext
    {
        public Cassandra.ISession Session { get; private set; }

        public CassandraDbContext(IConfiguration configuration)
        {
            var cluster = Cluster.Builder()
                .AddContactPoint(configuration["Cassandra:Host"])
                .WithPort(int.Parse(configuration["Cassandra:Port"]))
                .WithCredentials(
                    configuration["Cassandra:Username"],
                    configuration["Cassandra:Password"])
                .WithDefaultKeyspace(configuration["Cassandra:Keyspace"])
                .Build();

            Session = cluster.Connect();
        }
    }
}
