FROM python:3.14-slim

WORKDIR /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install dependencies
COPY requirements.txt .
RUN pip install uv && uv venv .venv && \
    . .venv/bin/activate && \
    uv pip install -r requirements.txt

# copy project
COPY . .