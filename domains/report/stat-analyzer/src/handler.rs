use actix_web::{post, get, web, HttpResponse, Responder};
use crate::model::StatAnalysis;
use crate::service::{insert_stat, get_stats};
use sqlx::PgPool;

// 🔁 Prometheus metric setup
use lazy_static::lazy_static;
use prometheus::{register_counter, Counter};

lazy_static! {
    static ref STATS_CREATED: Counter = register_counter!(
        "stats_created_total",
        "Number of stat entries successfully created"
    ).unwrap();
}

#[post("/api/stats")]
pub async fn create_stat(
    db: web::Data<PgPool>,
    stat: web::Json<StatAnalysis>,
) -> impl Responder {
    let stat = stat.into_inner();
    match insert_stat(db.get_ref(), stat).await {
        Ok(_) => {
            STATS_CREATED.inc(); // ✅ Increment on success
            HttpResponse::Ok().body("Stat analysis saved!")
        },
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}

#[get("/api/stats")]
pub async fn fetch_stats(
    db: web::Data<PgPool>,
) -> impl Responder {
    match get_stats(db.get_ref()).await {
        Ok(stats) => HttpResponse::Ok().json(stats),
        Err(e) => HttpResponse::InternalServerError().body(format!("Error: {}", e)),
    }
}
