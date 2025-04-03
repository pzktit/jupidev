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


_For most current list of tools see `Dockerfile`_.

## Usage

### With VS Code

1. Install the "Remote - Containers" extension in VS Code
2. Clone this repository
3. `sample` folder provides a sample of project using this image as a development container.
4. Open `sample` in VS Code
5. When prompted, select "Reopen in Container"
6. VS Code will initialize and start the container automatically.

### Build the image locally

Normally the image is build with GitHub action and is available as `ghcr.io/username/reponame`, i.e. `ghcr.io/pzktit/jupilab`.
You can build it locally too

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

Then update `.devcontainer/devcontainer.json` to use your version of the image.

 
### Manual Docker Usage

To image contains `Jupyter Notebook` and `Jupyter Lab`. To run any of these please do
```bash
docker run -it --rm \
  -p 127.0.0.1:8888:8888 \
  -v "$PWD:/home/vscode/workspace" \
  jupilab \
  jupyter lab --ip=0.0.0.0 --port=8888 --no-browser --allow-root --NotebookApp.token=''
```
Then point your browser to [http://127.0.0.1:8888](http://127.0.0.1:8888).

## License

[GNU General Public License v3.0](LICENSE)

This license ensures that all modifications to the software remain open source, prohibiting the creation of closed-source derivatives.
