# base image that includes R.
#FROM rstudio/r-base:3.6-xenial
FROM  r-base:3.6.3

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

# Install python dev
RUN apt-get install -y python3-pip python3-dev

## install python packages
RUN pip install --upgrade pip 
RUN pip install pip install -r requirements.txt

# Install system dependencies for the tidyverse R packages
RUN apt-get install -y \
    make \
    libcurl4-openssl-dev \
    libssl-dev \
    pandoc \
    libxml2-dev \
    r-cran-rgl

# copy file with packages requeriments
COPY requeriments.R ${HOME}requeriments.R

WORKDIR ${HOME}

## install R-packages
RUN Rscript requeriments.R


