FROM python:3.11.11-slim-bookworm

# Install system dependencies and Rust
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    g++ \
    libsndfile1 \
    ffmpeg \
    curl \
    git \
    && curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y \
    && rm -rf /var/lib/apt/lists/*

# Add Rust to PATH
ENV PATH="/root/.cargo/bin:${PATH}"

WORKDIR /app
COPY . /app

# Set models directory (if using built-in models dir)
# You must have the model checkpoint + config.json already in /app/models/
# Example: /app/models/blizzard/config.json and /app/models/blizzard/model.pth

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt && \
    python nltk_pkg.py

ENV PYTHONUNBUFFERED=1

# :fire: IMPORTANT: Make sure the app listens on the correct port for Render
ENV PORT=5050

# :large_green_circle: Start the server with gunicorn using Render's port
CMD ["gunicorn", "server:app", "--bind", "0.0.0.0:$PORT"]
