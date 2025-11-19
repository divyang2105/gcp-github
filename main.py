from fastapi import FastAPI
import os

app = FastAPI()

@app.get("/")
def hello_world():
    """Return a friendly HTTP greeting."""
    name = os.environ.get("NAME", "World")
    return {"message": f"Hello {name}!"}