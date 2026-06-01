#!/usr/bin/env bash
# Render build script for Django backend
set -o errexit  # Exit immediately on any error

# Install Python dependencies
pip install -r requirements.txt

# Collect static files for WhiteNoise to serve
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate