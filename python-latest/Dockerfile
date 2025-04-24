FROM ubuntu:latest

RUN apt-get update -y && \
    apt-get install -y --no-install-recommends \
    curl \
    ca-certificates \
    strace \
    && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ENV POETRY_VERSION=2.1.2
RUN curl -sSL https://install.python-poetry.org | python3 - && \
    ln -s ~/.local/bin/poetry /usr/local/bin/poetry

WORKDIR /app
COPY . .

RUN poetry install --no-root

CMD ["/bin/bash"]
