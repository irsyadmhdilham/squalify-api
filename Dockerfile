FROM python:3.6

RUN mkdir django_app

WORKDIR django_app/.

COPY . .

RUN pip install pipenv
ENV PIPENV_VENV_IN_PROJECT=1

ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN pipenv install