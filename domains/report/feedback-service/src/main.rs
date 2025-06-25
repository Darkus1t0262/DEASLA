mod handler;
use actix_web::{App, HttpServer, web};

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    HttpServer::new(|| {
        App::new()
            .route("/health", web::get().to(handler::health))
            .route("/api/feedback", web::post().to(handler::submit_feedback))
            .route("/api/feedbacks", web::get().to(handler::list_feedbacks))
    })
    .bind(("0.0.0.0", 4202))?
    .run()
    .await
}
