use crate::model::StatAnalysis;
use sqlx::{PgPool, Error};

pub async fn insert_stat(pool: &PgPool, mut stat: StatAnalysis) -> Result<(), Error> {
    let rec = sqlx::query!(
        r#"
        INSERT INTO stat_analysis (analysis_type, value, calculated_at)
        VALUES ($1, $2, NOW())
        RETURNING id, calculated_at
        "#,
        stat.analysis_type,
        stat.value,
    )
    .fetch_one(pool)
    .await?;

    stat.id = Some(rec.id);
    stat.calculated_at = Some(rec.calculated_at);

    Ok(())
}

pub async fn get_stats(pool: &PgPool) -> Result<Vec<StatAnalysis>, Error> {
    let stats = sqlx::query_as!(
        StatAnalysis,
        r#"
        SELECT id, analysis_type, value, calculated_at FROM stat_analysis ORDER BY calculated_at DESC
        "#
    )
    .fetch_all(pool)
    .await?;

    Ok(stats)
}
