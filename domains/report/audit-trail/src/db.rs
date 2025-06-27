use dotenv::dotenv;
use std::env;
use tokio_postgres::{Client, NoTls};

pub async fn connect_pg() -> Result<Client, tokio_postgres::Error> {
    dotenv().ok();
    let host = env::var("POSTGRES_HOST").unwrap();
    let user = env::var("POSTGRES_USER").unwrap();
    let password = env::var("POSTGRES_PASSWORD").unwrap();
    let db = env::var("POSTGRES_DB").unwrap();

    let conn_str = format!(
        "host={} user={} password={} dbname={}",
        host, user, password, db
    );

    let (client, connection) = tokio_postgres::connect(&conn_str, NoTls).await?;
    tokio::spawn(connection);
    Ok(client)
}
