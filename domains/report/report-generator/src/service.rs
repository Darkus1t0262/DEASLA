use crate::model::Report;
use sqlx::{PgPool, Error, Row};

/// Inserts a new report and retrieves its ID and timestamp.
pub async fn insert_report(pool: &PgPool, mut report: Report) -> Result<(), Error> {
    let row = sqlx::query(
        r#"
        INSERT INTO reports (title, description, generated_at)
        VALUES ($1, $2, NOW())
        RETURNING id, generated_at
        "#
    )
    .bind(&report.title)
    .bind(&report.description)
    .fetch_one(pool)
    .await?;

    report.id = Some(row.get("id"));
    report.generated_at = Some(row.get("generated_at"));
    Ok(())
}

/// Fetches all reports ordered by most recent first.
pub async fn get_reports(pool: &PgPool) -> Result<Vec<Report>, Error> {
    let reports = sqlx::query_as::<_, Report>(
        r#"
        SELECT id, title, description, generated_at
        FROM reports
        ORDER BY generated_at DESC
        "#
    )
    .fetch_all(pool)
    .await?;

    Ok(reports)
}
