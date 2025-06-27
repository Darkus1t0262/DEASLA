use crate::model::Report;
use sqlx::{PgPool, Error};

pub async fn insert_report(pool: &PgPool, mut report: Report) -> Result<(), Error> {
    let rec = sqlx::query!(
        r#"
        INSERT INTO reports (title, description, generated_at)
        VALUES ($1, $2, NOW())
        RETURNING id, generated_at
        "#,
        report.title,
        report.description,
    )
    .fetch_one(pool)
    .await?;

    report.id = Some(rec.id);
    report.generated_at = Some(rec.generated_at);

    Ok(())
}

pub async fn get_reports(pool: &PgPool) -> Result<Vec<Report>, Error> {
    let reports = sqlx::query_as!(
        Report,
        r#"
        SELECT id, title, description, generated_at FROM reports ORDER BY generated_at DESC
        "#
    )
    .fetch_all(pool)
    .await?;

    Ok(reports)
}
