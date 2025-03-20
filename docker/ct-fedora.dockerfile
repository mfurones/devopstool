# Official ubuntu image base 22.04LTS
FROM fedora:41 

ENV BUILD_VERSION=0.5.0
ENV BASH=True

# Setup shell (bash)
SHELL ["/bin/bash", "-c"]

WORKDIR /home

COPY ../scripts ./scripts
COPY ../requirements ./requirements

WORKDIR /home/scripts

RUN sh 000-main-fedora.sh

# pattern to keep the shell active
CMD ["tail", "-f", "/dev/null"]