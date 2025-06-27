use dotenv::dotenv;
use std::env;
use mongodb::{Client, options::ClientOptions};

/// Connects to MongoDB using environment variables.
/// Required vars: MONGO_HOST, MONGO_USER, MONGO_PASSWORD, MONGO_DB
pub async fn connect_db() -> mongodb::error::Result<Client> {
    dotenv().ok();

    let host = env::var("MONGO_HOST").unwrap_or_else(|_| "localhost".to_string());
    let user = env::var("MONGO_USER").unwrap_or_else(|_| "root".to_string());
    let password = env::var("MONGO_PASSWORD").unwrap_or_else(|_| "password".to_string());
    let db = env::var("MONGO_DB").unwrap_or_else(|_| "test".to_string());

    let uri = format!(
        "mongodb://{}:{}@{}:27017/{}",
        user, password, host, db
    );

    let client_options = ClientOptions::parse(&uri).await?;
    let client = Client::with_options(client_options)?;

    println!("✅ MongoDB connected successfully to {}", uri);
    Ok(client)
}
