#!/bin/sh
if [ "$DATABASE" = "postgres" ]
then
    echo "Waiting for postgres..."
while ! nc -z "$DB_HOSTNAME " "$DB_PORT"; do
      sleep 0.1
      echo "Waiting for postgres..."
    done
    echo "PostgreSQL started"
fi


CONTAINER_FIRST_STARTUP="CONTAINER_FIRST_STARTUP"
if [ ! -e /$CONTAINER_FIRST_STARTUP ]; then
    touch /$CONTAINER_FIRST_STARTUP
    # place your script that you only want to run on first startup.
    python3 manage.py makemigrations --noinput && \
    python3 manage.py migrate --noinput && \
    python3 manage.py collectstatic --noinput && \
    python3 manage.py createsuperuser --phone_number 09369998877 --first_name Superuser --email superuser@gmail.com --noinput && \
    gunicorn --bind 0.0.0.0:8000 config.wsgi --daemon && \
    python -m celery -A config worker -l info
else
    # script that should run the rest of the times (instances where you 
    # stop/restart containers).
    python3 manage.py makemigrations --noinput && \
    python3 manage.py migrate --noinput && \
    python3 manage.py collectstatic --noinput && \
    gunicorn --bind 0.0.0.0:8000 config.wsgi --daemon && \
    python -m celery -A config worker -l info
fi
exec "$@"
