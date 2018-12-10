#!/bin/bash

echo 'make migrations'
python manage.py makemigrations

echo 'migrate db'
python manage.py migrate

echo 'runserver'
python manage.py runserver 8030