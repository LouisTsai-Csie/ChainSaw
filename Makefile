.PHONY: install format lint type-check test clean setup-pre-commit

install:
	uv sync --extra dev

setup-pre-commit: install
	uv run pre-commit install

format:
	uv run ruff format .
	uv run ruff check --fix .

lint:
	uv run ruff check .

type-check:
	uv run mypy .

test:
	uv run pytest

clean:
	rm -rf .mypy_cache
	rm -rf .pytest_cache
	rm -rf .ruff_cache
	rm -rf __pycache__
	find . -type d -name __pycache__ -delete
	find . -name "*.pyc" -delete