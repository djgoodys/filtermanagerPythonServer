#!/bin/bash
# Exit on error
set -o errexit

echo "Starting build.sh script..."

# Install dependencies
echo "Installing dependencies..."
pip install -r requirements.txt

# Collect static files
echo "Collecting static files..."
python manage.py collectstatic --no-input

# Migrate the database
echo "Migrating the database..."
python manage.py migrate

# Create a superuser (optional)
echo "Creating superuser..."
python manage.py createsuperuser --username admin --email "YOUR@EMAIL.com" --noinput || true

echo "build.sh script finished."
