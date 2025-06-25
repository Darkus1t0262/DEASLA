use actix_web::{web, HttpResponse, Responder};
use crate::model::{ReportRequest, ReportResponse};
use crate::service::generate_report;

pub async fn health() -> impl Responder {
    HttpResponse::Ok().json(serde_json::json!({"status": "ok"}))
}

pub async fn generate_report(req: web::Json<ReportRequest>) -> impl Responder {
    let report = generate_report(req.into_inner());
    HttpResponse::Ok().json(&report)
}
