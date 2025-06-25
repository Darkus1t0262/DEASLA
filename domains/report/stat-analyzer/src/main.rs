mod handler;
use actix_web::{App, HttpServer, web};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/health", web::get().to(handler::health))
            .route("/api/analyze", web::post().to(handler::analyze_stats))
    })
    .bind(("0.0.0.0", 4205))?
    .run()
    .await
}
