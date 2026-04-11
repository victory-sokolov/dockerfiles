FROM python:3.14-bookworm
ADD requirements.txt /app/requirements.txt
ADD ./celery_main/ /app/
WORKDIR /app/
RUN pip install uv && uv venv .venv && \
    . .venv/bin/activate && \
    uv pip install -r requirements.txt
ENTRYPOINT celery -A celery_main worker --concurrency=5 --loglevel=info
