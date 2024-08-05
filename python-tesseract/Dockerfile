FROM python:3.10.14-slim-buster

WORKDIR /app

USER "viktor"

# create new user
RUN useradd -m -r $USER && \
    chown $USER /app

ENV DEBIAN_FRONTEND=noninteractive \
    LC_ALL=C \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_HOME="/home/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1 \
    POETRY_VERSION=1.8.3

ENV PATH="$POETRY_HOME/bin:$PATH"

RUN apt-get update && apt-get install --no-install-recommends -y \
    build-essential \
    pkg-config \
    libgl1-mesa-glx \
    libpq-dev \
    libtesseract-dev \
    libleptonica-dev \
    vim \
    git \
    curl \
    tesseract-ocr \
    tesseract-ocr-eng \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Poetry
RUN curl -sSL https://install.python-poetry.org | python3 -

COPY pyproject.toml poetry.lock ./

# install poetry dependencies
ARG INSTALL_DEV="false"
COPY pyproject.toml poetry.lock ./
RUN bash -c "if ["$INSTALL_DEV" == 'true']; then poetry install --no-root ; else poetry install --no-root --only main --no-directory; fi"
