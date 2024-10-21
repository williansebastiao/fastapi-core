include .env

SHELL := /bin/bash
.DEFAULT_GOAL := help
DOCKER_COMPOSE := docker-compose
DOCKER := docker exec -it fastapi-core-app
POETRY_CMD := poetry run

.PHONY: help scaffold start build stop container  pre-commit pre-commit-install pre-commit-update pylint-generate lint test flake black isort autoflake pylint

help:
	@echo "fastAPI Core"
	@echo "---------------------"
	@echo "Usage: make <command>"
	@echo ""
	@echo "Commands:"
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "  \033[36m%-26s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

scaffold: ## Start config to project
	poetry update
	$(POETRY_CMD) pre-commit install

start: ## Start all containers
	$(DOCKER_COMPOSE) up -d

build: ## Build all containers without detach
	$(DOCKER_COMPOSE) up --build

stop: ## Stop all containers
	$(DOCKER_COMPOSE) down

container: ## Enter the container
	$(DOCKER) bash

pre-commit: ## Run pre-commit
	$(POETRY_CMD) pre-commit run --all-files

pre-commit-install: ## Install pre-commit
	$(POETRY_CMD) pre-commit install

pre-commit-update: ## Update pre-commit
	$(POETRY_CMD) pre-commit autoupdate

pylint-generate: ## Generate pylint file
	$(POETRY_CMD) pylint --generate-rcfile > .pylintrc

lint: flake black isort autoflake pylint ## Run all linting tools

test: ## Run Pytest inside the Docker container
	$(DOCKER) $(POETRY_CMD) pytest

flake: ## Run Flake8
	@echo "Running flake tools..."
	@$(POETRY_CMD) flake8 . || echo "Flake8 found issues. Check the output above."

black: ## Run Black
	@echo "Running black tools..."
	@$(POETRY_CMD) black . || echo "Black found issues. Check the output above."

isort: ## Run Isort
	@echo "Running isort tools..."
	@$(POETRY_CMD) isort . || echo "Isort found issues. Check the output above."

autoflake: ## Run Autoflake
	@echo "Running autoflake tools..."
	@$(POETRY_CMD) autoflake --recursive --in-place --remove-unused-variables --remove-all-unused-imports --exclude=__init__.py . || echo "Autoflake found issues. Check the output above."

pylint: ## Run Pylint
	@echo "Running pylint tools..."
	@$(POETRY_CMD) pylint . --recursive=y || echo "Pylint found issues. Check the output above."