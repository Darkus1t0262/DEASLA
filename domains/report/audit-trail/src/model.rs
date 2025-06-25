use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Clone)]
pub struct LogRequest {
    pub actor: String,
    pub action: String,
}

#[derive(Serialize, Deserialize, Clone)]
pub struct AuditLog {
    pub id: usize,
    pub actor: String,
    pub action: String,
    pub timestamp: String,
}
