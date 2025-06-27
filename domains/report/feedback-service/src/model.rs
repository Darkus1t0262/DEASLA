use serde::{Serialize, Deserialize};
use bson::oid::ObjectId;

#[derive(Serialize, Deserialize, Debug, Clone)]
pub struct FeedbackRequest {
    pub user: String,
    pub comment: String,
}

#[derive(Serialize, Deserialize, Debug, Clone)]
pub struct Feedback {
    #[serde(rename = "_id", skip_serializing_if = "Option::is_none")]
    pub id: Option<ObjectId>,

    pub user: String,
    pub comment: String,

    #[serde(skip_serializing_if = "Option::is_none")]
    pub timestamp: Option<String>,
}
