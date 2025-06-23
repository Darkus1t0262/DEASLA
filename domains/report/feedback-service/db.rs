use postgres::{Client, NoTls};

pub fn connect() {
    let connection_string = std::env::var("DATABASE_URL")
        .unwrap_or("host=postgres user=deasla_user password=deasla_pass dbname=deasla_db".to_string());

    match Client::connect(&connection_string, NoTls) {
        Ok(_) => println!("✅ Connected to PostgreSQL"),
        Err(e) => println!("❌ PostgreSQL connection failed: {}", e),
    }
}
