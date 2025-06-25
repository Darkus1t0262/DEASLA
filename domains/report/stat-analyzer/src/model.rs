use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Clone)]
pub struct StatRequest {
    pub dataset: Vec<f64>,
}

#[derive(Serialize, Deserialize, Clone)]
pub struct StatResponse {
    pub mean: f64,
    pub min: f64,
    pub max: f64,
    pub count: usize,
}
