use actix_web::{web, HttpResponse, Responder};
use crate::model::{AuditLog, LogRequest};
use crate::service::{save_log, get_logs};
use std::sync::Mutex;

lazy_static::lazy_static! {
    static ref LOGS: Mutex<Vec<AuditLog>> = Mutex::new(vec![]);
}

pub async fn health() -> impl Responder {
    HttpResponse::Ok().json(serde_json::json!({"status": "ok"}))
}

pub async fn log_action(req: web::Json<LogRequest>) -> impl Responder {
    let mut logs = LOGS.lock().unwrap();
    let log = save_log(req.into_inner(), logs.len() + 1);
    logs.push(log.clone());
    HttpResponse::Ok().json(&log)
}

pub async fn list_logs() -> impl Responder {
    let logs = LOGS.lock().unwrap();
    HttpResponse::Ok().json(&*logs)
}
