use actix_web::{App, HttpServer, web};
use dotenv::dotenv;
use std::env;
use crate::handler::{create_metric, fetch_metrics, health_check};
use crate::mongo::connect_mongo;

mod handler;
mod service;
mod model;
mod mongo;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    let port = env::var("PORT").unwrap_or_else(|_| "4203".to_string()); // asegúrate que coincida con el .env
    let bind_addr = format!("0.0.0.0:{}", port);

    let db = connect_mongo().await.expect("❌ DB connection failed");
    let db_data = web::Data::new(db);

    println!("🚀 Metric Collector service running on {}", bind_addr);

    HttpServer::new(move || {
        App::new()
            .app_data(db_data.clone())
            .service(health_check)
            .service(create_metric)
            .service(fetch_metrics)
    })
    .bind(&bind_addr)?
    .run()
    .await
}
