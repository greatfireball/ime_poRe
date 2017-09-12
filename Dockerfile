FROM ubuntu:xenial

LABEL maintainer="frank.foerster@ime.fraunhofer.de"
LABEL description="Dockerfile providing the poRe quality assessment and sequence extraction software for MinION long reads"

RUN apt update && apt install --yes software-properties-common python-software-properties && add-apt-repository --yes ppa:marutter/rrutter

RUN apt update && apt install --yes r-base r-base-dev

RUN Rscript -e 'source("https://bioconductor.org/biocLite.R"); biocLite("rhdf5")'

RUN Rscript  -e 'install.packages(c("shiny","svDialogs","data.table","bit64"), repos=c("https://cloud.r-project.org"))'
