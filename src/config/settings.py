from pydantic_settings import BaseSettings, SettingsConfigDict


class Settings(BaseSettings):
    APP_ENV: str
    APP_NAME: str

    model_config = SettingsConfigDict(env_file=".env")


settings = Settings()
