use actix_web::{web, HttpResponse, Responder};
use crate::model::{StatRequest, StatResponse};
use crate::service::analyze;

pub async fn health() -> impl Responder {
    HttpResponse::Ok().json(serde_json::json!({"status": "ok"}))
}

pub async fn analyze_stats(req: web::Json<StatRequest>) -> impl Responder {
    let report = analyze(req.into_inner());
    HttpResponse::Ok().json(&report)
}
