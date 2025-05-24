# Dockerfile Optimization 🐳

Hi there! Hope you’re doing great. When it comes to building Docker images, doing it efficiently is key to keeping your apps scalable, secure, and easy to maintain. If your Dockerfiles aren’t well organized, you might end up with bulky images, slow build times, more security risks, and longer deployments. This repo shows how following best practices can really make a difference when creating Docker images for a **FastAPI** app.

Whether you’re deploying to production or just experimenting in development, optimizing your Docker images helps save resources, speeds up your CI/CD pipeline, and gets your app up and running faster.<br><br>

## Why Docker Image Optimization Matters?

Docker image optimization isn't just about saving disk space — it impacts:

- **Performance**: Smaller images load and start faster in containers.
- **Security**: Fewer layers and unnecessary packages reduce the attack surface.
- **Portability**: Optimized images are easier to transfer across networks and environments.
- **Maintainability**: Clear and layered Dockerfiles are easier to understand and update.

This project compares two Dockerfiles to show the real-world difference between a poorly constructed image and an optimized one.<br><br>

## Project Structure

This repository includes two Dockerfile versions:

- `Dockerfile.bad`: Demonstrates bad practices such as:
  - No `.dockerignore` file
  - Large, unnecessary base images
  - Installing dependencies without caching or cleanup

- `Dockerfile.good`: Demonstrates good practices such as:
  - Using slim base images
  - Efficient use of Docker layer caching
  - Clean dependency management and minimal final image size<br><br>

## Get Started

To test and compare the image sizes, follow these steps:

### 1. **Clone the repository**  
   ```bash
      git clone https://github.com/dieglos18/fastapi-dockerfile-optimization.git
      cd fastapi-dockerfile-optimization
   ```

### 2. **Install prerequisites** 

  - Make sure Docker is installed and running. You can download it from [Here](https://www.docker.com/products/docker-desktop)

  - On Windows, install `make` using Chocolatey:
  - Open PowerShell as Administrator and run:
   ```bash
choco install make
```

Use Git Bash (installed with Git for Windows) to run the make commands.

### 3. **Run the build and comparison process**

 ```bash
make compare
```
This command will:

  - Build both `Dockerfile.bad` and `Dockerfile.good`
  - Print their image sizes side by side


### 4. **Optional** - Clean up the images
 ```bash
make clean
```
<br>

## MakeFile Results

![Screenshot 2025-05-24 182659](https://github.com/user-attachments/assets/8c856e7d-2f85-4e1e-840a-8a3ebc9efd0a)


