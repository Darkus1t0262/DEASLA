use crate::model::{ReportRequest, ReportResponse};

pub fn generate_report(req: ReportRequest) -> ReportResponse {
    // Simulate a PDF/CSV report by returning a string
    let filename = format!("report-{}.csv", req.kind);
    let content = format!("Report Type: {}\nFilter: {}\nData: ...", req.kind, req.filter.unwrap_or("None".into()));
    ReportResponse {
        filename,
        content,
    }
}
