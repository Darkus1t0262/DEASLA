use actix_web::{post, get, web, HttpResponse, Responder};
use crate::model::Report;
use crate::service::{insert_report, get_reports};
use mongodb::Database;

#[post("/api/reports")]
pub async fn create_report(
    db: web::Data<Database>,
    report: web::Json<Report>,
) -> impl Responder {
    let report = report.into_inner();
    match insert_report(db.get_ref(), report).await {
        Ok(_) => HttpResponse::Ok().body("Report submitted!"),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}

#[get("/api/reports")]
pub async fn fetch_reports(
    db: web::Data<Database>,
) -> impl Responder {
    match get_reports(db.get_ref()).await {
        Ok(reports) => HttpResponse::Ok().json(reports),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}
