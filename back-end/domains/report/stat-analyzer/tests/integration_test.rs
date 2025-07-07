#[actix_rt::test]
async fn test_health() {
    let resp = reqwest::get("http://localhost:4205/health")
        .await
        .unwrap();
    assert!(resp.status().is_success());
}
