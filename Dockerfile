FROM python:3.6

RUN mkdir app

WORKDIR app/.

COPY . .

RUN pip install -r requirements.txt

ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone