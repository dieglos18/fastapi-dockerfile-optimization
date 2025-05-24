## Dockerfile Optimization
This repository shows how to optimize a `Dockerfile` for a FastAPI application. Two versions are included:

- `Dockerfile.bad`: a heavy image with bad practices (no .dockerignore, unnecessarily large base image, installation without caching, etc.).

- `Dockerfile.good`: a lightweight and optimized image with good practices (slim image, use of layers, efficient installation).


## MakeFile Results

![Screenshot 2025-05-24 182659](https://github.com/user-attachments/assets/8c856e7d-2f85-4e1e-840a-8a3ebc9efd0a)


