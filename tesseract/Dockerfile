FROM ubuntu:19.10

ENV DEBIAN_FRONTEND=noninteractive
ENV TESSERACT=/usr/share/tesseract-ocr
ENV TESSDATA_PREFIX=/usr/share/tesseract/tessdata

RUN apt-get update && apt-get install -y \
    build-essential \
    software-properties-common \
    python3.7 \
    cmake \
    autoconf \
    automake \
    libtool \
    pkg-config \
    libpng-dev \
    tesseract-ocr \
    libtesseract-dev \
    libpango1.0-dev \
    libicu-dev \
    libcairo2-dev \
    libjpeg8-dev \
    zlib1g-dev \
    libtiff5-dev \
    wget \
    git \
    g++ \
    vim \
    tesseract-ocr-eng

WORKDIR $TESSERACT

RUN git clone https://github.com/tesseract-ocr/tesseract
RUN git clone https://github.com/tesseract-ocr/langdata_lstm

WORKDIR $TESSERACT/tesseract

# Compile Tesseract
RUN ./autogen.sh \
    ./configure \
    make \
    make install \
    ldconfig \
    make training \
    make training-install
