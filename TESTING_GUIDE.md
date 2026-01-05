# Testing Guide - Step by Step

This guide will walk you through testing the Dockerfile comparison project.

## Prerequisites

- Docker installed and running
- Python 3.11+ installed
- `make` command available (usually pre-installed on macOS/Linux)
- Terminal/Command Prompt access

## Step 1: Install Python Dependencies

First, install the required Python packages:

```bash
pip install -r requirements.txt
```

Or if you prefer using a virtual environment:

```bash
python -m venv venv
source venv/bin/activate  # On Windows: venv\Scripts\activate
pip install -r requirements.txt
```

## Step 2: Test the FastAPI Application Locally

Start the FastAPI server:

```bash
uvicorn app.main:app --reload
```

You should see output like:
```
INFO:     Uvicorn running on http://127.0.0.1:8000 (Press CTRL+C to quit)
INFO:     Started reloader process
INFO:     Started server process
INFO:     Waiting for application startup.
INFO:     Application startup complete.
```

### Test the API Endpoints:

1. **Root endpoint**: Open your browser and visit:
   ```
   http://localhost:8000
   ```
   You should see a JSON response with a message and comparison link.

2. **Comparison page**: Visit:
   ```
   http://localhost:8000/comparison
   ```
   You should see a beautiful HTML page comparing the two Dockerfiles with:
   - Metrics cards showing image sizes
   - Comparison table with all features
   - Best practices section
   - Issues section

3. **API documentation**: FastAPI automatically generates interactive docs at:
   ```
   http://localhost:8000/docs
   ```

Press `CTRL+C` to stop the server when done.

## Step 3: Build Docker Images

Now let's build both Docker images to see the size difference.

### Option A: Build Both Images and Compare (Recommended)

Run the compare command which builds both images and shows the comparison:

```bash
make compare
```

This will:
1. Build `Dockerfile.bad` (takes a few minutes)
2. Build `Dockerfile.good` (takes a few minutes)
3. Display a formatted comparison table in the terminal

### Option B: Build Images Individually

If you want to build them separately:

```bash
# Build the bad (unoptimized) image
make build-bad

# Build the good (optimized) image
make build-good

# Compare the sizes
make compare-sizes
```

## Step 4: View the Comparison Table

After building both images, the terminal will display a formatted table like:

```
╔════════════════════════════════════════════════════════════╗
║           DOCKER IMAGES SIZE COMPARISON                     ║
╚════════════════════════════════════════════════════════════╝

┌─────────────────────┬──────────────────┬──────────────────┐
│ Image               │ Size             │ Status           │
├─────────────────────┼──────────────────┼──────────────────┤
│ Dockerfile.bad      │ 900MB            │ ❌ Not optimized │
│ Dockerfile.good     │ 150MB            │ ✅ Optimized     │
└─────────────────────┴──────────────────┴──────────────────┘

💡 Tip: Visit http://localhost:8000/comparison to see detailed analysis
```

## Step 5: Run the Application in Docker (Optional)

You can also run the application using the Docker images:

### Using the optimized image (recommended):

```bash
docker run -p 8000:8000 fastapi-good
```

Then visit `http://localhost:8000/comparison` in your browser.

### Using the unoptimized image:

```bash
docker run -p 8000:8000 fastapi-bad
```

## Step 6: Clean Up (Optional)

To remove the Docker images after testing:

```bash
make clean
```

Or manually:

```bash
docker rmi fastapi-bad fastapi-good
```

## Expected Results

- **Dockerfile.bad**: Should produce an image around **900MB**
- **Dockerfile.good**: Should produce an image around **150MB**
- **Savings**: Approximately **83% reduction** in image size

## Troubleshooting

### Issue: `make` command not found
- **macOS/Linux**: Usually pre-installed
- **Windows**: Install via Chocolatey: `choco install make`, or use Git Bash

### Issue: Docker not running
- Start Docker Desktop or Docker daemon
- Verify with: `docker ps`

### Issue: Port 8000 already in use
- Change the port in the uvicorn command: `uvicorn app.main:app --reload --port 8001`
- Or stop the process using port 8000

### Issue: Images not building
- Ensure Docker is running
- Check you're in the project root directory
- Verify Dockerfile.bad and Dockerfile.good exist

## Summary

You've successfully:
1. ✅ Tested the FastAPI application locally
2. ✅ Viewed the comparison page in the browser
3. ✅ Built both Docker images
4. ✅ Seen the size comparison in the terminal
5. ✅ Understood the optimization benefits

The project demonstrates how proper Dockerfile optimization can reduce image size by over 80% while maintaining functionality!

