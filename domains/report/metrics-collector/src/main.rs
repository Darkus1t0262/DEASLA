mod handler;
use actix_web::{App, HttpServer, web};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/health", web::get().to(handler::health))
            .route("/api/metrics", web::post().to(handler::add_metric))
            .route("/api/metrics", web::get().to(handler::list_metrics))
    })
    .bind(("0.0.0.0", 4203))?
    .run()
    .await
}
