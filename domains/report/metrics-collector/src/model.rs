use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Clone)]
pub struct MetricRequest {
    pub name: String,
    pub value: f64,
}

#[derive(Serialize, Deserialize, Clone)]
pub struct Metric {
    pub id: usize,
    pub name: String,
    pub value: f64,
    pub timestamp: String,
}
