use actix_web::{App, HttpServer, web};
use dotenv::dotenv;
use std::env;
use crate::handler::{create_stat, fetch_stats};
use crate::db::connect_db;

mod handler;
mod service;
mod model;
mod db;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    let port = env::var("PORT").unwrap_or_else(|_| "8085".to_string());
    let bind_addr = format!("0.0.0.0:{}", port);

    let pool = connect_db().await;
    let pool_data = web::Data::new(pool);

    println!("🚀 Stat analyzer service running on {}", bind_addr);

    HttpServer::new(move || {
        App::new()
            .app_data(pool_data.clone())
            .service(create_stat)
            .service(fetch_stats)
    })
    .bind(&bind_addr)?
    .run()
    .await
}
