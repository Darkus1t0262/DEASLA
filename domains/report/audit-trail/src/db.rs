use dotenv::dotenv;
use sqlx::{PgPool, postgres::PgPoolOptions};
use std::env;

/// Connects to PostgreSQL using environment variables.
pub async fn connect_pg() -> Result<PgPool, sqlx::Error> {
    dotenv().ok();

    let database_url = env::var("DATABASE_URL")
        .expect("❌ DATABASE_URL must be set in environment or .env");

    let pool = PgPoolOptions::new()
        .max_connections(5)
        .connect(&database_url)
        .await?;

    println!("✅ Connected to PostgreSQL");

    Ok(pool)
}
