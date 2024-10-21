FROM python:3.12-alpine

WORKDIR /code

ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1

RUN apk update && apk add --no-cache \
    bash \
    libcurl \
    curl-dev \
    openssl \
    curl \
    nano \
    python3-dev \
    gcc \
    musl-dev \
    libffi-dev \
    tzdata \
    build-base \
    make

RUN pip install poetry pycurl debugpy

RUN poetry config virtualenvs.create false

COPY pyproject.toml poetry.lock ./

RUN poetry install --no-root --no-interaction

RUN mkdir src

COPY ./src ./src

EXPOSE 8000 5678