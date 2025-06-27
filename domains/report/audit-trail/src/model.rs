use serde::{Serialize, Deserialize};
use chrono::{NaiveDateTime};

#[derive(Serialize, Deserialize, Clone)]
pub struct LogRequest {
    pub actor: String,
    pub action: String,
    // Add any other fields you POST from the client
}

#[derive(Serialize, Deserialize, Clone)]
pub struct AuditLog {
    pub id: i32,                         // i32 to match PostgreSQL SERIAL type
    pub actor: String,
    pub action: String,
    pub timestamp: NaiveDateTime,        // or String if you prefer
}
