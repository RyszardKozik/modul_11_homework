FROM python:3.11-slim

WORKDIR /code

COPY pyproject.toml poetry.lock /code/

RUN pip install poetry
RUN poetry config virtualenvs.create false
RUN poetry install --no-dev

COPY . /code/

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]
