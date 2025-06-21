use actix_web::{web, App, HttpResponse, HttpServer, Responder};

async fn index() -> impl Responder {
    HttpResponse::Ok().body("Hello from report-generator!")
}

#[actix_web::main]
async fn main() -> std::io::Result<()> {
    println!("Starting report-generator on port 3000...");
    HttpServer::new(|| {
        App::new().route("/", web::get().to(index))
    })
    .bind("0.0.0.0:3000")?
    .run()
    .await
}
