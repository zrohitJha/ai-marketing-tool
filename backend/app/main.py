from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

app = FastAPI()

# CORS middleware
app.add_middleware(
    CORSMiddleware,
    allow_origins=["*"],  # Allows all origins for CORS
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)

# Basic routes
@app.get("/")
async def read_root():
    return {"message": "Welcome to the AI Marketing Tool API!"}

@app.get("/items/{item_id}")
async def read_item(item_id: int):
    return {"item_id": item_id, "message": "This is an item detail."}

# API documentation is automatically generated at /docs and /redoc