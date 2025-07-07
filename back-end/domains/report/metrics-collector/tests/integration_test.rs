#[actix_rt::test]
async fn test_health() {
    let resp = reqwest::get("http://localhost:4203/health")
        .await
        .unwrap();
    assert!(resp.status().is_success());
}
