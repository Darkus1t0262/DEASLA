use actix_web::{post, get, web, HttpResponse, Responder};
use crate::model::LogRequest;
use crate::service::{save_log, get_logs};
use sqlx::PgPool;

#[post("/api/audit")]
pub async fn submit_log(
    pool: web::Data<PgPool>,
    payload: web::Json<LogRequest>,
) -> impl Responder {
    match save_log(payload.into_inner(), pool.get_ref()).await {
        Ok(log) => HttpResponse::Ok().json(log),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}

#[get("/api/audit")]
pub async fn fetch_logs(
    pool: web::Data<PgPool>,
) -> impl Responder {
    match get_logs(pool.get_ref()).await {
        Ok(logs) => HttpResponse::Ok().json(logs),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}
