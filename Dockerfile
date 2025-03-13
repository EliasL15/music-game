FROM python:3.11-slim
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Set a reliable DNS server (Google DNS) to help with DNS resolution issues.
RUN echo "nameserver 8.8.8.8" > /etc/resolv.conf

# Install Gunicorn and Eventlet directly
RUN pip install --no-cache-dir gunicorn eventlet

# Copy Python requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Python application and React build files
COPY app.py .
COPY my-react-app/build ./my-react-app/build

# Expose port
EXPOSE 8000

# Start the application with Gunicorn using Eventlet as the worker class
CMD ["gunicorn", "--worker-class", "eventlet", "--workers", "1", "--bind", "0.0.0.0:8000", "--log-level", "debug", "--access-logfile", "-", "--error-logfile", "-", "app:app"]
