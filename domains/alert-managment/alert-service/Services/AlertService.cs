using AlertServiceApp.Models;
using Cassandra; // still needed for SimpleStatement, Cluster, etc.
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using AlertServiceApp.Services;  // Ensure the correct namespace is referenced



namespace AlertServiceApp.Services
{
    public class AlertService
    {
        private readonly Cassandra.ISession _session;
        private readonly KafkaProducer _kafkaProducer;  // Add KafkaProducer as a dependency

        // Inject KafkaProducer into the service
        public AlertService(Cassandra.ISession session, KafkaProducer kafkaProducer)
        {
            _session = session;
            _kafkaProducer = kafkaProducer; // Set KafkaProducer via constructor
        }

        // Fetch all alerts from Cassandra
        public async Task<List<Alert>> GetAllAlerts()
        {
            var alerts = new List<Alert>();
            var rs = await _session.ExecuteAsync(new SimpleStatement("SELECT * FROM alerts"));

            foreach (var row in rs)
            {
                alerts.Add(new Alert
                {
                    Id = row.GetValue<Guid>("id"),
                    Message = row.GetValue<string>("message"),
                    CreatedAt = row.GetValue<DateTime>("createdat")
                });
            }

            return alerts;
        }

        // Create a new alert in Cassandra and send it to Kafka
        public async Task<Alert> CreateAlert(Alert alert)
        {
            // Insert alert into Cassandra
            var stmt = new SimpleStatement("INSERT INTO alerts (id, message, createdat) VALUES (?, ?, ?)",
                alert.Id, alert.Message, alert.CreatedAt);
            await _session.ExecuteAsync(stmt);

            // Send alert message to Kafka
            await _kafkaProducer.ProduceMessage($"New alert created: {alert.Message}");

            return alert;
        }
    }
}
