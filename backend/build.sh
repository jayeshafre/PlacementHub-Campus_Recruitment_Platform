#!/usr/bin/env bash
# Render build script for Django backend
set -o errexit  # Exit immediately on any error

# Install Python dependencies
pip install -r requirements.txt

# Collect static files for WhiteNoise to serve
python manage.py collectstatic --no-input

# Apply database migrations
python manage.py migrate

python manage.py shell -c "
from users.models import CustomUser
if not CustomUser.objects.filter(email='admin@ex.com').exists():
    CustomUser.objects.create_superuser(username='admin', email='admin@ex.com', password='Admin@123', full_name='Admin')
    print('Superuser created')
else:
    print('Already exists')
"