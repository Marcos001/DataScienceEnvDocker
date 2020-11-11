# base image that includes R.
FROM rstudio/r-base:3.5-xenial

ARG HOME

# Install system dependencies for R
RUN apt-get update -qq && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-transport-https \
    build-essential \
    wget \
    curl \
    gfortran \
    libatlas-base-dev \
    libbz2-dev \
    libcairo2 \
    libcurl4-openssl-dev \
    libicu-dev \
    liblzma-dev \
    libpango-1.0-0 \
    libpangocairo-1.0-0 \
    libpcre3-dev \
    libtcl8.6 \
    libtiff5 \
    libtk8.6 \
    libx11-6 \
    libxt6 \
    locales \
    tzdata \
    zlib1g-dev \
    libreadline-dev

# Install system dependencies for the tidyverse R packages
RUN apt-get install -y \
    make \
    libcurl4-openssl-dev \
    libssl-dev \
    pandoc \
    libxml2-dev

# copy file with packages requeriments
COPY requeriments.R ${HOME}requeriments.R

WORKDIR ${HOME}

## install R-packages
RUN Rscript requeriments.R
