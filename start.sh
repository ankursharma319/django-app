#!/bin/sh

echo Collecting static files
python manage.py collectstatic --noinput

sleep 10

echo Applying database migrations
python manage.py migrate

# Start Gunicorn processes
echo Starting Gunicorn.
exec gunicorn wsgi:application \
    --bind 0.0.0.0:8000 \
    --workers 3