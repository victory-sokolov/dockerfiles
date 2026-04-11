FROM python:3.14-slim-bookworm

WORKDIR /app

USER "viktor"

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
    UV_COMPILE_BINARIES=1

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

COPY requirements.txt ./

RUN pip install uv && uv venv .venv && \
    . .venv/bin/activate && \
    uv pip install -r requirements.txt
