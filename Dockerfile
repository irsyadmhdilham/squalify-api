FROM python:3.6

COPY . .

RUN pip install -r requirements.txt

ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

EXPOSE 8030

CMD gunicorn --workers=4 -b :8030 django_app.wsgi