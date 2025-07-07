use serde::{Serialize, Deserialize};
use chrono::NaiveDateTime;

#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct LogRequest {
    pub actor: String,
    pub action: String,
}

#[derive(Serialize, Deserialize, Clone, Debug, sqlx::FromRow)]
pub struct AuditLog {
    pub id: i32,
    pub actor: String,
    pub action: String,
    pub timestamp: NaiveDateTime, // Compatible with PostgreSQL TIMESTAMP
}
