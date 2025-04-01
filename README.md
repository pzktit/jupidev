<!-- LTeX: language=en-US -->

# Docker Environment for my Python Projects

This repository provides a development container (`devcontainer`) designed specifically for cryptography-related work with Jupyter notebooks.

## Overview

The CryptoDev environment includes a pre-configured Docker setup that combines all the necessary tools and libraries for cryptographic research, algorithm implementation, and educational work.

## Features

- Jupyter Notebook/Lab environment
- Pre-installed cryptography libraries:

  - `cryptography`
  - `pycryptodome`

- Mathematical libraries:
  - `numpy`
  - `matplotlib`
- Qiskit
- Development tools:
  - Git
  - Python 3
  - Common development utilities

_For most current list see `Dockerfile`_.

## Usage

### With VS Code

1. Install the "Remote - Containers" extension in VS Code
2. Clone this repository
3. `sample` folder provides a sample of project using this image as a development container.
4. Open `sample` in VS Code
5. When prompted, select "Reopen in Container"
6. VS Code will initialize and start the container automatically

### Manual Docker Usage

To build the image yourself:

1. Introduce required modifications to `Dockerfile`.
2. Build the image

```bash
docker build -t  username/image_name .
```

3. Push the image to Docker Hub (optional)

```
docker login
docker push username/image_name
```

4. Update `sample/.devcontainer/devcontainer.json` to use your image.

## License

[GNU General Public License v3.0](LICENSE)

This license ensures that all modifications to the software remain open source, prohibiting the creation of closed-source derivatives.
