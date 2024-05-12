FROM mcr.microsoft.com/devcontainers/javascript-node:0-18

ARG VARIANT="18"
ARG NODE_VERSION=${VARIANT}

RUN su node -c "umask 0002 && . /usr/local/share/nvm/nvm.sh && nvm install ${NODE_VERSION} && nvm alias default ${NODE_VERSION}"
ENV NVM_DIR=/home/node/.nvm 
ENV PATH=/home/node/.nvm/versions/node/v${NODE_VERSION}/bin:${PATH}

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends apt-utils dialog 2>&1

RUN apt-get install -y \
    git \
    procps \
    curl \
    lsb-release \
    software-properties-common
