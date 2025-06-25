use chrono::Utc;
use crate::model::{FeedbackRequest, Feedback};

pub fn save_feedback(req: FeedbackRequest, id: usize) -> Feedback {
    Feedback {
        id,
        user: req.user,
        comment: req.comment,
        timestamp: Utc::now().to_rfc3339(),
    }
}

pub fn get_feedbacks() -> Vec<Feedback> {
    // Handled via Mutex in handler for demo
    vec![]
}
