use actix_web::{App, HttpServer, web};
use dotenv::dotenv;
use std::env;
use crate::handler::{create_metric, fetch_metrics};
use crate::db::connect_db;

mod handler;
mod service;
mod model;
mod db;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok(); // Load env vars from .env if present

    // Allow port override via env
    let port = env::var("PORT").unwrap_or_else(|_| "8083".to_string());
    let bind_addr = format!("0.0.0.0:{}", port);

    let db = connect_db().await.expect("DB connection failed");
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
