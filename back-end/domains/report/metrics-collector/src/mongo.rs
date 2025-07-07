use dotenv::dotenv;
use std::env;
use mongodb::{Client, options::ClientOptions};

pub async fn connect_mongo() -> mongodb::error::Result<Client> {
    dotenv().ok();
    let host = env::var("MONGO_HOST").unwrap();
    let user = env::var("MONGO_USER").unwrap();
    let password = env::var("MONGO_PASSWORD").unwrap();
    let db = env::var("MONGO_DB").unwrap();

    let uri = format!(
        "mongodb://{}:{}@{}:27017/{}",
        user, password, host, db
    );
    let client_options = ClientOptions::parse(&uri).await?;
    let client = Client::with_options(client_options)?;
    Ok(client)
}
