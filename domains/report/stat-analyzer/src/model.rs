    use serde::{Serialize, Deserialize};

    #[derive(Debug, Serialize, Deserialize, sqlx::FromRow)]
    pub struct StatAnalysis {
        pub id: Option<i32>,
        pub analysis_type: String,
        pub value: f64,
        pub calculated_at: Option<chrono::NaiveDateTime>,
    }
