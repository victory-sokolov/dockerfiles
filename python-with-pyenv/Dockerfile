FROM ubuntu:24.04

ENV PYTHON_VERSION=3.14.0

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    libssl-dev \
    zlib1g-dev \
    libbz2-dev \
    libreadline-dev \
    libsqlite3-dev \
    libncurses5-dev \
    libncursesw5-dev \
    xz-utils \
    tk-dev \
    libffi-dev \
    liblzma-dev \
    git

RUN git clone https://github.com/pyenv/pyenv.git .pyenv

ENV HOME /home/ubuntu
ENV PYENV_ROOT $HOME/.pyenv
ENV PATH $PYENV_ROOT/shims:$PYENV_ROOT/bin:$PATH

RUN pyenv install $PYTHON_VERSION
RUN pyenv global $PYTHON_VERSION
RUN pyenv rehash
