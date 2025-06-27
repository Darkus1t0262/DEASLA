use crate::model::{Feedback, FeedbackRequest};
use mongodb::{
    Database,
    bson::{to_document, from_document},
    error::Result,
};
use chrono::Utc;
use futures::StreamExt;

pub async fn save_feedback(db: &Database, req: FeedbackRequest) -> Result<()> {
    let collection = db.collection("feedbacks");

    let feedback = Feedback {
        id: None, // Let MongoDB assign _id automatically
        user: req.user,
        comment: req.comment,
        timestamp: Some(Utc::now().to_rfc3339()),
    };

    let doc = to_document(&feedback)?;
    collection.insert_one(doc, None).await?;
    Ok(())
}

pub async fn get_feedbacks(db: &Database) -> Result<Vec<Feedback>> {
    let collection = db.collection("feedbacks");
    let mut cursor = collection.find(None, None).await?;
    let mut feedbacks = Vec::new();

    while let Some(result) = cursor.next().await {
        match result {
            Ok(doc) => match from_document::<Feedback>(doc) {
                Ok(feedback) => feedbacks.push(feedback),
                Err(e) => eprintln!("⚠️ Failed to parse document: {:?}", e),
            },
            Err(e) => eprintln!("⚠️ Error reading from DB: {:?}", e),
        }
    }

    Ok(feedbacks)
}
