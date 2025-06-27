use crate::model::Report;
use mongodb::{Database, bson::{to_document, from_document, doc}, error::Result};
use chrono::Utc;

pub async fn insert_report(db: &Database, mut report: Report) -> Result<()> {
    let collection = db.collection("reports");
    report.created_at = Some(Utc::now().to_rfc3339());
    let doc = to_document(&report)?;
    collection.insert_one(doc, None).await?;
    Ok(())
}

pub async fn get_reports(db: &Database) -> Result<Vec<Report>> {
    let collection = db.collection("reports");
    let mut cursor = collection.find(None, None).await?;
    let mut reports = Vec::new();
    while let Some(result) = cursor.next().await {
        match result {
            Ok(doc) => {
                let report: Report = from_document(doc).unwrap();
                reports.push(report);
            },
            Err(e) => eprintln!("Error reading report: {:?}", e),
        }
    }
    Ok(reports)
}
