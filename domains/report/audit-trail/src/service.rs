use crate::model::{LogRequest, AuditLog};
use sqlx::{PgPool, Row};

/// Saves an audit log to the database and returns the created log.
pub async fn save_log(req: LogRequest, pool: &PgPool) -> Result<AuditLog, sqlx::Error> {
    let row = sqlx::query(
        r#"
        INSERT INTO audit_logs (actor, action, timestamp)
        VALUES ($1, $2, NOW())
        RETURNING id, actor, action, timestamp
        "#
    )
    .bind(&req.actor)
    .bind(&req.action)
    .fetch_one(pool)
    .await?;

    Ok(AuditLog {
        id: row.get("id"),
        actor: row.get("actor"),
        action: row.get("action"),
        timestamp: row.get("timestamp"),
    })
}

/// Retrieves all audit logs ordered by timestamp.
pub async fn get_logs(pool: &PgPool) -> Result<Vec<AuditLog>, sqlx::Error> {
    let logs = sqlx::query_as::<_, AuditLog>(
        r#"
        SELECT id, actor, action, timestamp
        FROM audit_logs
        ORDER BY timestamp DESC
        "#
    )
    .fetch_all(pool)
    .await?;

    Ok(logs)
}
