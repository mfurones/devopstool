# https://ubuntu.com/about/release-cycle
FROM ubuntu:24.04 

# Setup shell (bash)
SHELL ["/bin/bash", "-c"]

WORKDIR /home

COPY ../scripts ./scripts

WORKDIR /home/scripts

RUN bash 000-main.sh

RUN pwsh -File ./001-main.ps1

# pattern to keep the shell active
CMD ["sleep", "infinity"]