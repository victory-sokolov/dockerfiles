FROM python:3.8.3-slim-buster

WORKDIR /app

USER "viktor"

# create new user
RUN useradd -m -r $USER && \
    chown $USER /app

ENV LC_ALL=C \
    PYTHONDONTWRITEBYTECODE=1 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100 \
    POETRY_HOME="/home/poetry" \
    POETRY_VIRTUALENVS_CREATE=false \
    POETRY_NO_INTERACTION=1 \
    POETRY_VERSION=1.0.10 \
    PYSETUP_PATH="/home/pysetup"

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

# install Poetry
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -

COPY pyproject.toml ./

# install poetry dependencies
RUN poetry install