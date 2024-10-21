from fastapi import APIRouter, status
from fastapi.responses import JSONResponse

router = APIRouter()


@router.get("/", tags=["Default"])
async def index():
    return JSONResponse(
        content={"message": "Hey... it's running..."},
        status_code=status.HTTP_200_OK,
    )


@router.get("/health", tags=["Health"])
async def health():
    return JSONResponse(
        content={"message": "Health is going well"},
        status_code=status.HTTP_200_OK,
    )
