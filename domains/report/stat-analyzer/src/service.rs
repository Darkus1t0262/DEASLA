use crate::model::{StatRequest, StatResponse};

pub fn analyze(req: StatRequest) -> StatResponse {
    let count = req.dataset.len();
    let mean = if count > 0 {
        req.dataset.iter().sum::<f64>() / count as f64
    } else { 0.0 };
    let min = req.dataset.iter().cloned().fold(f64::INFINITY, f64::min);
    let max = req.dataset.iter().cloned().fold(f64::NEG_INFINITY, f64::max);

    StatResponse { mean, min, max, count }
}
