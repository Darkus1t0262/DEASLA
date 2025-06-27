use actix_web::{App, HttpServer, web};
use dotenv::dotenv;
use std::env;
use crate::handler::{create_metric, fetch_metrics};
use crate::mongo::connect_mongo; // ✅ correct function

mod handler;
mod service;
mod model;
mod mongo;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok(); // Load env vars from .env if present

    let port = env::var("PORT").unwrap_or_else(|_| "8083".to_string());
    let bind_addr = format!("0.0.0.0:{}", port);

    let db = connect_mongo().await.expect("DB connection failed"); // ✅ updated
    let db_data = web::Data::new(db);

    println!("🚀 Metric Collector service running on {}", bind_addr);

    HttpServer::new(move || {
        App::new()
            .app_data(db_data.clone())
            .service(create_metric)
            .service(fetch_metrics)
    })
    .bind(&bind_addr)?
    .run()
    .await
}
