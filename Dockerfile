# Use an official lightweight Python image.
# https://hub.docker.com/_/python
FROM python:3.10-slim

# Set environment variables
# 1. Prevents Python from writing pyc files to disc.
# 2. Prevents Python from buffering stdout and stderr.
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set the working directory in the container.
WORKDIR /app

# Copy the requirements file into the container.
COPY requirements.txt .

# Install dependencies.
RUN pip install --no-cache-dir -r requirements.txt

# Copy the application code into the container.
COPY main.py .

# Run the application.
# Gunicorn is a production-ready WSGI server.
CMD exec gunicorn --bind :$PORT --workers 1 --threads 8 --timeout 0 main:app
