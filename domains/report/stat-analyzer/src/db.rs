use dotenv::dotenv;
use sqlx::{PgPool, postgres::PgPoolOptions};
use std::env;

/// Connects to PostgreSQL using `sqlx` and returns a PgPool.
pub async fn connect_pg() -> Result<PgPool, sqlx::Error> {
    dotenv().ok();

    // Read and use the full database URL from the environment
    let database_url = env::var("DATABASE_URL").expect("❌ DATABASE_URL must be set");

    PgPoolOptions::new()
        .max_connections(5)
        .connect(&database_url)
        .await
}
