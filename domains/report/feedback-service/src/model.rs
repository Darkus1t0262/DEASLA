use serde::{Serialize, Deserialize};

#[derive(Serialize, Deserialize, Clone)]
pub struct FeedbackRequest {
    pub user: String,
    pub comment: String,
}

#[derive(Serialize, Deserialize, Clone)]
pub struct Feedback {
    pub id: usize,
    pub user: String,
    pub comment: String,
    pub timestamp: String,
}
