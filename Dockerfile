# Use an official Python runtime as a parent image
FROM python:3.9-slim-buster

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /app

# Install gunicorn as prod WSGI HTTP Server
RUN pip install gunicorn==20.1.0

# Install Python dependencies
COPY requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy project
COPY src /app/src

# Go to src
WORKDIR /app/src

# Run the application
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]
