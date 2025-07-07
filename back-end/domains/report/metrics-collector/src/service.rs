use crate::model::Metric;
use mongodb::{Database, bson::{to_document, from_document}, error::Result};
use chrono::Utc;
use futures::stream::StreamExt;

pub async fn insert_metric(db: &Database, mut metric: Metric) -> Result<()> {
    let collection = db.collection("metrics");

    // Set fallback if source not provided
    if metric.source.is_none() {
        metric.source = Some("unknown".to_string());
    }

    // Set timestamp
    metric.collected_at = Some(Utc::now().to_rfc3339());

    // Debug: Print input
    println!("📥 Received metric: {:?}", metric);

    // Convert to BSON document
    let doc = match to_document(&metric) {
        Ok(doc) => doc,
        Err(e) => {
            eprintln!("❌ Error serializing metric: {:?}", e);
            return Err(e.into()); // 👈 FIX aquí
        }
    };

    // Insert
    match collection.insert_one(doc, None).await {
        Ok(res) => {
            println!("✅ Inserted metric with ID: {:?}", res.inserted_id);
            Ok(())
        },
        Err(e) => {
            eprintln!("❌ Failed to insert metric: {:?}", e);
            Err(e)
        }
    }
}

pub async fn get_metrics(db: &Database) -> Result<Vec<Metric>> {
    let collection = db.collection("metrics");
    let mut cursor = collection.find(None, None).await?;
    let mut metrics = Vec::new();

    while let Some(result) = cursor.next().await {
        match result {
            Ok(doc) => match from_document::<Metric>(doc) {
                Ok(metric) => metrics.push(metric),
                Err(e) => eprintln!("⚠️ Failed to parse document: {:?}", e),
            },
            Err(e) => eprintln!("⚠️ Error reading from DB: {:?}", e),
        }
    }

    Ok(metrics)
}
