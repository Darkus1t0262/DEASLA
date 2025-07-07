use serde::{Serialize, Deserialize};

#[derive(Debug, Serialize, Deserialize, sqlx::FromRow)]
pub struct Report {
    pub id: Option<i32>,
    pub title: String,
    pub description: String,
    pub generated_at: Option<chrono::NaiveDateTime>,
}
