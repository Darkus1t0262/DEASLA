use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Clone)]
pub struct ReportRequest {
    pub kind: String,
    pub filter: Option<String>,
}

#[derive(Serialize, Deserialize, Clone)]
pub struct ReportResponse {
    pub filename: String,
    pub content: String, // In real scenario, a link or file
}
