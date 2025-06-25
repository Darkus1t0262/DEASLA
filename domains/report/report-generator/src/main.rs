mod handler;
use actix_web::{App, HttpServer, web};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/health", web::get().to(handler::health))
            .route("/api/report", web::post().to(handler::generate_report))
    })
    .bind(("0.0.0.0", 4204))?
    .run()
    .await
}
