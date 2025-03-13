# Stage 1: Build React frontend
FROM node:18-alpine as frontend-builder
WORKDIR /app/frontend
COPY my-react-app/package*.json ./
RUN npm ci
COPY my-react-app/ ./
RUN npm run build

# Stage 2: Python application
FROM python:3.11-slim
WORKDIR /app

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy Python requirements and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy Python application
COPY app.py .

# Copy built React files from frontend-builder stage
COPY --from=frontend-builder /app/frontend/build ./my-react-app/build

# Set environment variables
ENV FLASK_APP=app.py
ENV FLASK_ENV=production

# Expose port
EXPOSE 8000

# Start the application
CMD ["python", "-m", "flask", "run", "--host=0.0.0.0", "--port=8000"]