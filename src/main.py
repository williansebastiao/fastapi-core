from fastapi import FastAPI

from src.routes import health, user

app = FastAPI(
    title="FastAPI Core",
)

app.include_router(health)
app.include_router(user)
