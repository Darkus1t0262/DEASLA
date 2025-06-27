use actix_web::{web, HttpResponse, Responder};
use crate::model::{AuditLog, LogRequest};
use crate::service::{save_log, get_logs};

pub async fn health() -> impl Responder {
    match crate::db::connect_pg().await {
        Ok(_) => HttpResponse::Ok().json(serde_json::json!({"status": "ok"})),
        Err(_) => HttpResponse::InternalServerError().json(serde_json::json!({"status": "db_error"})),
    }
}

pub async fn log_action(req: web::Json<LogRequest>) -> impl Responder {
    // Connect to the DB
    match crate::db::connect_pg().await {
        Ok(client) => {
            match save_log(req.into_inner(), &client).await {
                Some(log) => HttpResponse::Ok().json(log),
                None => HttpResponse::InternalServerError().body("Failed to save log"),
            }
        }
        Err(_) => HttpResponse::InternalServerError().body("DB connection error"),
    }
}

pub async fn list_logs() -> impl Responder {
    // Connect to the DB
    match crate::db::connect_pg().await {
        Ok(client) => {
            let logs = get_logs(&client).await;
            HttpResponse::Ok().json(logs)
        }
        Err(_) => HttpResponse::InternalServerError().body("DB connection error"),
    }
}
