FROM python:3.14-bookworm
COPY requirements.txt /app/requirements.txt
COPY ./celery_main/ /app/
WORKDIR /app/
RUN pip install uv && uv venv .venv && \
    . .venv/bin/activate && \
    uv pip install -r requirements.txt
ENV PATH="/app/.venv/bin:$PATH"
ENTRYPOINT celery -A celery_main worker --concurrency=5 --loglevel=info
