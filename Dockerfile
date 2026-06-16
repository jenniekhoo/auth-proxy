# Use an official, lightweight Python runtime environment
FROM python:3.11-slim

# Prevent Python from writing .pyc files to disk and force unbuffered logging
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# Set the active working directory inside the container
WORKDIR /app

# Step 1: Copy only dependency configurations to leverage layer caching
COPY requirements.txt .

# Step 2: Install required packages
RUN pip install --no-cache-dir -r requirements.txt

# Step 3: Copy the rest of the application source code 
COPY . .

# Cloud Run defaults to exposing traffic on port 8080
EXPOSE 8080

# Command to execute the Python runtime application engine
CMD ["python", "main.py"]
