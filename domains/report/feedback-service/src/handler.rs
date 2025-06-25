use actix_web::{web, HttpResponse, Responder};
use crate::model::{Feedback, FeedbackRequest};
use crate::service::{save_feedback, get_feedbacks};
use std::sync::Mutex;

lazy_static::lazy_static! {
    static ref FEEDBACKS: Mutex<Vec<Feedback>> = Mutex::new(vec![]);
}

pub async fn health() -> impl Responder {
    HttpResponse::Ok().json(serde_json::json!({"status": "ok"}))
}

pub async fn submit_feedback(req: web::Json<FeedbackRequest>) -> impl Responder {
    let mut feedbacks = FEEDBACKS.lock().unwrap();
    let fb = save_feedback(req.into_inner(), feedbacks.len() + 1);
    feedbacks.push(fb.clone());
    HttpResponse::Ok().json(&fb)
}

pub async fn list_feedbacks() -> impl Responder {
    let feedbacks = FEEDBACKS.lock().unwrap();
    HttpResponse::Ok().json(&*feedbacks)
}
