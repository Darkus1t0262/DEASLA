use actix_web::{post, get, web, HttpResponse, Responder};
use crate::model::Metric;
use crate::service::{insert_metric, get_metrics};
use mongodb::Database;

#[post("/api/metrics")]
pub async fn create_metric(
    db: web::Data<Database>,
    metric: web::Json<Metric>,
) -> impl Responder {
    let metric = metric.into_inner();
    match insert_metric(db.get_ref(), metric).await {
        Ok(_) => HttpResponse::Ok().body("Metric collected!"),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}

#[get("/api/metrics")]
pub async fn fetch_metrics(
    db: web::Data<Database>,
) -> impl Responder {
    match get_metrics(db.get_ref()).await {
        Ok(metrics) => HttpResponse::Ok().json(metrics),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}
