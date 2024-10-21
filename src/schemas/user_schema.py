from pydantic import BaseModel, EmailStr


class UserSchema(BaseModel):
    first_name: str
    last_name: str
    email: EmailStr


class ErrorSchema(BaseModel):
    detail: str = "Not Found"
