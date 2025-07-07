use actix_web::{HttpResponse, Responder};
use prometheus::{Encoder, TextEncoder, gather};

pub async fn metrics_endpoint() -> impl Responder {
    let encoder = TextEncoder::new();
    let metric_families = gather();

    let mut buffer = Vec::new();
    encoder.encode(&metric_families, &mut buffer).unwrap();

    HttpResponse::Ok()
        .content_type("text/plain; version=0.0.4")
        .body(String::from_utf8(buffer).unwrap())
}
