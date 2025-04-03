ARG VARIANT=3.12-bullseye
ARG D2_VERSION=0.6.9

FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

ENV DEBIAN_FRONTEND=noninteractive
ARG D2_VERSION

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        curl \
        bash \
        ca-certificates \
        inotify-tools \
        imagemagick \
        librsvg2-bin \
        tar \
    && rm -rf /var/lib/apt/lists/*

# Jupyter environment
RUN pip3 install --disable-pip-version-check --no-cache-dir ipykernel jupyter jupyterlab notebook-intelligence
# Packages used in cryptographic projects
RUN pip3 install --disable-pip-version-check --no-cache-dir pycryptodomex cryptography
# Qiskit packages
RUN pip3 install --disable-pip-version-check --no-cache-dir \
matplotlib \
pylatexenc \
qiskit[visualization] \
qiskit_aer \
qiskit-ibm-runtime

RUN curl -L -o /tmp/d2.tar.gz https://github.com/terrastruct/d2/releases/download/v${D2_VERSION}/d2-v${D2_VERSION}-linux-amd64.tar.gz && \
    mkdir -p /usr/local/d2-${D2_VERSION} && \
    tar -xzf /tmp/d2.tar.gz -C /usr/local/d2-${D2_VERSION} --strip-components=1 && \
    ln -s /usr/local/d2-${D2_VERSION}/bin/d2 /usr/local/bin/d2 && \
    rm /tmp/d2.tar.gz

# Install local script into PATH
COPY d2watch /usr/local/bin/d2watch
RUN chmod +x /usr/local/bin/d2watch

USER vscode

RUN mkdir -p /home/vscode/workspace
