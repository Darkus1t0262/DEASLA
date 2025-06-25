from fastapi import APIRouter
from src.models import GraphQLQuery, GraphQLResponse
from src.service import execute_graphql

router = APIRouter()

@router.post("/", response_model=GraphQLResponse)
def graphql_endpoint(request: GraphQLQuery):
    data = execute_graphql(request.query)
    return GraphQLResponse(data=data)
