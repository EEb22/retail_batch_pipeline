up:
	docker compose --env-file ./env up --build -d

down:
	docker compose down

run-etl:
	docker exec runner python /code/etl/run_etl.py

shell:
	docker exec -ti runner bash

format:
	docker exec runner python -m black -S --line-length 79 .

isort:
	docker exec runner isort .

pytest:
	docker exec runner python -m pytest /code/test

type:
	docker exec runner mypy --ignore-missing-imports /code

lint:
	docker exec runner flake8 /code

ci: isort format type lint pytest
