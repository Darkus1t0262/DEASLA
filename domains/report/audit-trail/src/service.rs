use tokio_postgres::Client;
use crate::model::{LogRequest, AuditLog};
use chrono::{Utc, NaiveDateTime};

pub async fn save_log(req: LogRequest, client: &Client) -> Option<AuditLog> {
    let now = Utc::now().naive_utc(); // current time for timestamp
    let stmt = client.prepare(
        "INSERT INTO audit_logs (actor, action, timestamp) VALUES ($1, $2, $3) RETURNING id"
    ).await.ok()?;
    let row = client.query_one(&stmt, &[&req.actor, &req.action, &now]).await.ok()?;
    let id: i32 = row.get("id");
    Some(AuditLog {
        id,
        actor: req.actor,
        action: req.action,
        timestamp: now,
    })
}

pub async fn get_logs(client: &Client) -> Vec<AuditLog> {
    let mut logs = Vec::new();
    let stmt = client.prepare("SELECT id, actor, action, timestamp FROM audit_logs").await.ok();
    if let Some(stmt) = stmt {
        if let Ok(rows) = client.query(&stmt, &[]).await {
            for row in rows {
                logs.push(AuditLog {
                    id: row.get("id"),
                    actor: row.get("actor"),
                    action: row.get("action"),
                    timestamp: row.get("timestamp"),
                });
            }
        }
    }
    logs
}
