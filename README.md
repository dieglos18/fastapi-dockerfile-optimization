### *Dockerfile Optimization*
This repository shows how to optimize a `Dockerfile` for a FastAPI application. Two versions are included:

- `Dockerfile.bad`: a heavy image with bad practices (no .dockerignore, unnecessarily large base image, installation without caching, etc.).

- `Dockerfile.good`: a lightweight and optimized image with good practices (slim image, use of layers, efficient installation).

