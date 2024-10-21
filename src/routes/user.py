from fastapi import APIRouter, status

from src.schemas import ErrorSchema, UserSchema

router = APIRouter(prefix="/users", tags=["User"])


@router.get(
    "/",
    response_model=UserSchema,
    status_code=status.HTTP_200_OK,
    responses={
        404: {"model": ErrorSchema, "description": "Validation error"},
    },
)
async def index(): ...
