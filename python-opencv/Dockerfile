ARG DEFAULT_PYTHON_VERSION=3.10.14

FROM python:${PYTHON_VERSION:-${DEFAULT_PYTHON_VERSION}}-bookworm AS base

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    PYTHONIOENCODING=UTF-8 \
    PIP_NO_CACHE_DIR=off \
    PIP_DISABLE_PIP_VERSION_CHECK=on \
    PIP_DEFAULT_TIMEOUT=100


RUN echo "Acquire::http::Pipeline-Depth 0;" > /etc/apt/apt.conf.d/99custom && \
    echo "Acquire::http::No-Cache true;" >> /etc/apt/apt.conf.d/99custom && \
    echo "Acquire::BrokenProxy    true;" >> /etc/apt/apt.conf.d/99custom

RUN apt-get clean \
    && apt-get update && apt-get upgrade -y \
    && apt-get install -y --fix-missing \
    build-essential 


COPY . .

RUN pip install -r requirements.txt

EXPOSE 8085

CMD ["python", "-u", "main.py"]
