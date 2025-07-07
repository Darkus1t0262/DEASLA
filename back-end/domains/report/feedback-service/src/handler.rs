use actix_web::{post, get, web, HttpResponse, Responder};
use crate::model::{Feedback, FeedbackRequest};
use crate::service::{save_feedback, get_feedbacks};
use mongodb::Database;

#[post("/api/feedback")]
pub async fn submit_feedback(
    db: web::Data<Database>,
    payload: web::Json<FeedbackRequest>,
) -> impl Responder {
    match save_feedback(db.get_ref(), payload.into_inner()).await {
        Ok(_) => HttpResponse::Ok().body("Feedback submitted!"),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}

#[get("/api/feedback")]
pub async fn fetch_feedback(
    db: web::Data<Database>,
) -> impl Responder {
    match get_feedbacks(db.get_ref()).await {
        Ok(items) => HttpResponse::Ok().json(items),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}
