use dotenv::dotenv;
use std::env;
use mongodb::{Client, Database, options::ClientOptions};

/// Connects to MongoDB using environment variables.
/// Returns a `Database` instance.
pub async fn connect_db() -> mongodb::error::Result<Database> {
    dotenv().ok();

    let host = env::var("MONGO_HOST").unwrap_or_else(|_| "localhost".to_string());
    let user = env::var("MONGO_USER").unwrap_or_else(|_| "root".to_string());
    let password = env::var("MONGO_PASSWORD").unwrap_or_else(|_| "password".to_string());
    let db_name = env::var("MONGO_DB").unwrap_or_else(|_| "deasla_logs".to_string());

    // Use `authSource=admin` if the user was created in the "admin" database
    let uri = format!(
        "mongodb://{}:{}@{}:27017/{}?authSource=admin",
        user, password, host, db_name
    );

    let client_options = ClientOptions::parse(&uri).await?;
    let client = Client::with_options(client_options)?;
    let db = client.database(&db_name);

    println!("✅ MongoDB connected successfully to database `{}` at {}", db_name, host);
    Ok(db)
}
