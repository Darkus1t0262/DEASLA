use actix_web::{App, HttpServer, web};
use dotenv::dotenv;
use std::env;

use crate::handler::{create_stat, fetch_stats};
use crate::db::connect_pg;
use crate::metrics::metrics_endpoint;

mod handler;
mod service;
mod model;
mod db;
mod metrics; // 👈 new module

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    let port = env::var("PORT").unwrap_or_else(|_| "4205".to_string());
    let bind_addr = format!("0.0.0.0:{}", port);

    // Connect to PostgreSQL
    let pool = connect_pg()
        .await
        .expect("❌ Failed to connect to PostgreSQL");
    let pool_data = web::Data::new(pool);

    println!("🚀 Stat analyzer running on http://{}", bind_addr);

    HttpServer::new(move || {
        App::new()
            .app_data(pool_data.clone())
            .service(create_stat)
            .service(fetch_stats)
            .route("/metrics", web::get().to(metrics_endpoint)) // 👈 new route
    })
    .bind(&bind_addr)?
    .run()
    .await
}
