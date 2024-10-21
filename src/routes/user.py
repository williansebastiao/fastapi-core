from fastapi import APIRouter, HTTPException, status
from fastapi.responses import JSONResponse

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
async def index():
    try:
        user = UserSchema(
            first_name="Joe",
            last_name="Doe",
            email="joe.doe@gmail.com",
        )
        return JSONResponse(
            content=user.model_dump(),
            status_code=status.HTTP_200_OK,
        )
    except Exception as e:
        raise HTTPException(
            status_code=status.HTTP_422_UNPROCESSABLE_ENTITY,
            detail=str(e),
        ) from e
