use serde::{Serialize, Deserialize};
use bson::oid::ObjectId;

#[derive(Debug, Serialize, Deserialize)]
pub struct Metric {
    #[serde(rename = "_id", skip_serializing_if = "Option::is_none")]
    pub id: Option<ObjectId>,
    pub name: String,
    pub value: f64,
    pub source: Option<String>, // ahora es opcional
    pub collected_at: Option<String>, // se establece en service
}
