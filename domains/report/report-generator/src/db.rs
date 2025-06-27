use dotenv::dotenv;
use std::env;
use sqlx::{postgres::PgPoolOptions, PgPool};

pub async fn connect_db() -> PgPool {
    dotenv().ok();
    let host = env::var("POSTGRES_HOST").unwrap();
    let user = env::var("POSTGRES_USER").unwrap();
    let password = env::var("POSTGRES_PASSWORD").unwrap();
    let db = env::var("POSTGRES_DB").unwrap();

    let conn_str = format!(
        "postgres://{}:{}@{}:5432/{}",
        user, password, host, db
    );

    PgPoolOptions::new()
        .max_connections(5)
        .connect(&conn_str)
        .await
        .expect("Failed to connect to Postgres")
}
