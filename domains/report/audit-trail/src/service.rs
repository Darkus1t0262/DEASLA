use chrono::Utc;
use crate::model::{LogRequest, AuditLog};

pub fn save_log(req: LogRequest, id: usize) -> AuditLog {
    AuditLog {
        id,
        actor: req.actor,
        action: req.action,
        timestamp: Utc::now().to_rfc3339(),
    }
}

pub fn get_logs() -> Vec<AuditLog> {
    // For demonstration, handled in handler with Mutex
    vec![]
}
