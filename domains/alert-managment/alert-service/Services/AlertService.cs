using AlertService.Models;
using Cassandra; // still needed for SimpleStatement, Cluster, etc.
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace AlertService.Services
{
    public class AlertManagerService
    {
        private readonly Cassandra.ISession _session;

        public AlertManagerService(Cassandra.ISession session)
        {
            _session = session;
        }

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

        public async Task<Alert> CreateAlert(Alert alert)
        {
            var stmt = new SimpleStatement("INSERT INTO alerts (id, message, createdat) VALUES (?, ?, ?)",
                alert.Id, alert.Message, alert.CreatedAt);
            await _session.ExecuteAsync(stmt);
            return alert;
        }
    }
}
