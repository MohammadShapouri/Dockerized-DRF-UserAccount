FROM python:alpine

# set environment variable
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# set django superuser password
ENV DJANGO_SUPERUSER_PASSWORD superuser

# set work directory
RUN mkdir /app
WORKDIR /app

# install pyscopg2 dependencies
RUN apk update
RUN apk add --no-cache postgresql-dev gcc python3-dev musl-dev linux-headers

# install dependencies
RUN pip install --default-timeout=120 --upgrade pip
COPY ./requirements.txt /req/requirements.txt
RUN pip install --default-timeout=120 -r /req/requirements.txt

# check database connection
COPY ./entrypoint.sh /sh/entrypoint.sh
# RUN sed -i 's/\r$//g' /sh/entrypoint.sh
RUN chmod +x /sh/entrypoint.sh
ENTRYPOINT ["/sh/entrypoint.sh"]

# run django commands
# CMD while ! config/python3 manage.py sqlflush > /dev/null 2>&1 ; do sleep 1 ; done && \
# 	python3 config/manage.py makemigrations --noinput && \
# 	python3 config/manage.py migrate --noinput && \
# 	python3 config/manage.py collectstatic --noinput && \
#     python3 config/manage.py collectstatic && \
#     python3 config/manage.py createsuperuser --phone_number 09365358877 --first_name Superuser --email superuser@gmail.com --noinput && \
# 	gunicorn --bind 0.0.0.0:8000 config/config.wsgi
