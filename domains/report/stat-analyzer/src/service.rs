use crate::model::StatAnalysis;
use sqlx::{PgPool, Error, Row};

/// Inserts a new stat into the database and updates the struct with DB-generated fields.
pub async fn insert_stat(pool: &PgPool, mut stat: StatAnalysis) -> Result<(), Error> {
    let row = sqlx::query(
        r#"
        INSERT INTO stat_analysis (analysis_type, value, calculated_at)
        VALUES ($1, $2, NOW())
        RETURNING id, calculated_at
        "#
    )
    .bind(&stat.analysis_type)
    .bind(stat.value)
    .fetch_one(pool)
    .await?;

    stat.id = Some(row.get("id"));
    stat.calculated_at = Some(row.get("calculated_at"));
    Ok(())
}

/// Retrieves all stats sorted by most recent first.
pub async fn get_stats(pool: &PgPool) -> Result<Vec<StatAnalysis>, Error> {
    let stats = sqlx::query_as::<_, StatAnalysis>(
        r#"
        SELECT id, analysis_type, value, calculated_at
        FROM stat_analysis
        ORDER BY calculated_at DESC
        "#
    )
    .fetch_all(pool)
    .await?;

    Ok(stats)
}
