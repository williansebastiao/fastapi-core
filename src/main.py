import logging

from fastapi import FastAPI

from src.routes import health, user

logging.basicConfig(
    level=logging.INFO,
    format="%(levelname)s: %(asctime)s %(message)s",
    datefmt="%Y-%m-%d",
)

logger = logging.getLogger(__name__)

app = FastAPI(
    title="FastAPI Core",
)


@app.on_event("startup")
async def startup_event():
    logger.info("Application started: http://127.0.0.1:8000/docs")


app.include_router(health)
app.include_router(user)
