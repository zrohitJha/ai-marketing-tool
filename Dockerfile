# Dockerfile for Python FastAPI Backend

# Stage 1: Build
FROM python:3.11-slim AS build

# Set working directory
WORKDIR /app

# Install build dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy application files
COPY . .

# Stage 2: Run
FROM python:3.11-slim

# Set working directory
WORKDIR /app

# Copy only necessary files from the build stage
COPY --from=build /app /app

# Expose the port FastAPI is running on
EXPOSE 8000

# Command to run the application
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000", "--reload"]