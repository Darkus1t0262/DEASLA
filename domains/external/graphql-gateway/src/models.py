from pydantic import BaseModel

class GraphQLQuery(BaseModel):
    query: str

class GraphQLResponse(BaseModel):
    data: dict
    errors: list = []
