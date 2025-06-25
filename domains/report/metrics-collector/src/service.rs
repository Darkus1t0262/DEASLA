use chrono::Utc;
use crate::model::{MetricRequest, Metric};

pub fn save_metric(req: MetricRequest, id: usize) -> Metric {
    Metric {
        id,
        name: req.name,
        value: req.value,
        timestamp: Utc::now().to_rfc3339(),
    }
}

pub fn get_metrics() -> Vec<Metric> {
    // Handled by Mutex in handler for demo
    vec![]
}
