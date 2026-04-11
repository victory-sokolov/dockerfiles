FROM python:3.14-slim-bookworm

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    strace \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /app
COPY . .

RUN pip install uv && uv venv .venv && \
    . .venv/bin/activate && \
    uv pip install -r requirements.txt

CMD ["/bin/bash"]
