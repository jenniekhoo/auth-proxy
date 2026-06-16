# Use an official lightweight Python runtime as a parent image
FROM python:3.11-slim

# Set environment variables to keep Python from writing .pyc files or buffering stdout
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the working directory inside the container
WORKDIR /app

# Copy the requirements file first to leverage Docker cache layers
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of your Python application code
COPY . .

# Cloud Run defaults to port 8080
EXPOSE 8080

# Command to run your Python application (adjust main:app based on your web framework like FastAPI/Flask)
CMD ["python", "main.py"]
