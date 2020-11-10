FROM ubuntu:xenial

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


# download a version of R and build from source
ARG R_VERSION
RUN wget https://cdn.rstudio.com/r/ubuntu-1604/pkgs/r-${R_VERSION}_1_amd64.deb
RUN apt-get install -y gdebi-core
RUN gdebi r-${R_VERSION}_1_amd64.deb


# be sure you request a specific version of R - =3.4.4-1ubuntu1
RUN apt-get install -y r-base

# copy file
COPY requeriments.R /home/fts/requeriments.R

## install R-packages  dependencies=TRUE,
RUN R -e "install.packages('dplyr', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rgl', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('fNonlinear', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ppclust', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('EMD', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('tseriesChaos', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('TSdist', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('Metrics', repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('beepr', repos='http://cran.rstudio.com/')"

#CMD Rscript /home/fts/ requeriments.R



