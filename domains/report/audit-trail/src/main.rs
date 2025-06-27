mod handler;
mod db;

use actix_web::{App, HttpServer, web};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    dotenv::dotenv().ok(); // <--- Add this so .env is loaded!

    HttpServer::new(|| {
        App::new()
            .route("/health", web::get().to(handler::health))
            .route("/api/audit/log", web::post().to(handler::log_action))
            .route("/api/audit/logs", web::get().to(handler::list_logs))
    })
    .bind(("0.0.0.0", 4201))?
    .run()
    .await
}
