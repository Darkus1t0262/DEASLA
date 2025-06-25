def execute_graphql(query: str) -> dict:
    # Stub: pretend to resolve a GraphQL query
    if "users" in query:
        return {"users": [{"id": 1, "name": "Alice"}]}
    return {"ok": True}
