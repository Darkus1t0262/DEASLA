use crate::model::Metric;
use mongodb::{Database, bson::{to_document, from_document}, error::Result};
use chrono::Utc;
use futures::stream::StreamExt;

pub async fn insert_metric(db: &Database, mut metric: Metric) -> Result<()> {
    let collection = db.collection("metrics");
    metric.collected_at = Some(Utc::now().to_rfc3339());
    let doc = to_document(&metric)?;
    collection.insert_one(doc, None).await?;
    Ok(())
}

pub async fn get_metrics(db: &Database) -> Result<Vec<Metric>> {
    let collection = db.collection("metrics");
    let mut cursor = collection.find(None, None).await?;
    let mut metrics = Vec::new();
    while let Some(result) = cursor.next().await {
        match result {
            Ok(doc) => {
                let metric: Metric = from_document(doc).unwrap();
                metrics.push(metric);
            },
            Err(e) => eprintln!("Error reading metric: {:?}", e),
        }
    }
    Ok(metrics)
}
