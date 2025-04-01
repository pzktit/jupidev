ARG VARIANT=3.12-bullseye
FROM mcr.microsoft.com/vscode/devcontainers/python:${VARIANT}

# [Optional] Uncomment this section to install additional OS packages.
# RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
#     && apt-get -y install --no-install-recommends <your-package-list-here>

# Jupyter environment
RUN pip3 install --disable-pip-version-check --no-cache-dir ipykernel jupyter
# Packages used in cryptographic projects
RUN pip3 install --disable-pip-version-check --no-cache-dir pycryptodomex cryptography
# Qiskit packages
RUN pip install --disable-pip-version-check --no-cache-dir \
matplotlib \
pylatexenc \
qiskit[visualization] \
qiskit_aer \
qiskit-ibm-runtime

USER vscode

RUN mkdir -p /home/vscode/workspace
