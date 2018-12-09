FROM python:3.6

COPY . .

RUN python manage.py makemigrations

RUN python manage.py createsuperuser 

RUN python manage.py migrate