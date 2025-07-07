use actix_web::{App, HttpServer, web};
use dotenv::dotenv;
use std::env;
use crate::handler::{submit_feedback, fetch_feedback};
use crate::mongo::connect_db;

mod handler;
mod service;
mod model;
mod mongo;

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv().ok();

    let port = env::var("PORT").unwrap_or_else(|_| "8082".to_string());
    let bind_addr = format!("0.0.0.0:{}", port);

    let db = connect_db().await.expect("DB connection failed");
    let db_data = web::Data::new(db);

    println!("🚀 Feedback service running on {}", bind_addr);

    HttpServer::new(move || {
        App::new()
            .app_data(db_data.clone())
            .service(submit_feedback)
            .service(fetch_feedback)
    })
    .bind(&bind_addr)?
    .run()
    .await
}
