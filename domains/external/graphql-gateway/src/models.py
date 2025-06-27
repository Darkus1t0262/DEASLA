from pydantic import BaseModel
from sqlalchemy import Column, Integer, String
from sqlalchemy.ext.declarative import declarative_base

Base = declarative_base()

# ORM for users table
class User(Base):
    __tablename__ = "users"
    id = Column(Integer, primary_key=True, index=True)
    name = Column(String, index=True)

# Pydantic models
class GraphQLQuery(BaseModel):
    query: str

class GraphQLResponse(BaseModel):
    data: dict
    errors: list = []
