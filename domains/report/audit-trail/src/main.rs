use actix_web::{App, HttpServer, web};
use dotenv::dotenv;
use std::env;

use crate::handler::{submit_log, fetch_logs};
use crate::db::connect_pg;

mod handler;
mod service;
mod model;
mod db;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    let port = env::var("PORT").unwrap_or_else(|_| "8084".to_string());
    let bind_addr = format!("0.0.0.0:{}", port);

    let pool = connect_pg().await.expect("❌ Failed to connect to PostgreSQL");
    let pool_data = web::Data::new(pool);

    println!("🚀 Audit Trail service running on http://{}", bind_addr);

    HttpServer::new(move || {
        App::new()
            .app_data(pool_data.clone())
            .service(submit_log)
            .service(fetch_logs)
    })
    .bind(&bind_addr)?
    .run()
    .await
}
