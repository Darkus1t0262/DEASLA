use actix_web::{web, HttpResponse, Responder};
use crate::model::{Metric, MetricRequest};
use crate::service::{save_metric, get_metrics};
use std::sync::Mutex;

lazy_static::lazy_static! {
    static ref METRICS: Mutex<Vec<Metric>> = Mutex::new(vec![]);
}

pub async fn health() -> impl Responder {
    HttpResponse::Ok().json(serde_json::json!({"status": "ok"}))
}

pub async fn add_metric(req: web::Json<MetricRequest>) -> impl Responder {
    let mut metrics = METRICS.lock().unwrap();
    let metric = save_metric(req.into_inner(), metrics.len() + 1);
    metrics.push(metric.clone());
    HttpResponse::Ok().json(&metric)
}

pub async fn list_metrics() -> impl Responder {
    let metrics = METRICS.lock().unwrap();
    HttpResponse::Ok().json(&*metrics)
}
