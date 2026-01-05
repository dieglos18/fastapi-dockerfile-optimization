from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles
from fastapi.responses import FileResponse
from pathlib import Path

app = FastAPI()

# Mount static directory
static_path = Path(__file__).parent.parent / "static"
if static_path.exists():
    app.mount("/static", StaticFiles(directory=str(static_path)), name="static")

# Mount assets directory
assets_path = Path(__file__).parent.parent / "assets"
if assets_path.exists():
    app.mount("/assets", StaticFiles(directory=str(assets_path)), name="assets")

@app.get("/")
def read_root():
    return {
        "message": "Hello from FastAPI",
        "comparison": "/comparison - View Dockerfiles comparison"
    }

@app.get("/comparison")
def comparison():
    """Endpoint that serves the Dockerfiles comparison page"""
    html_path = static_path / "comparison.html"
    if html_path.exists():
        return FileResponse(html_path)
    return {"error": "Comparison page not found"}
