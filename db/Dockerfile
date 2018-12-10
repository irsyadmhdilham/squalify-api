FROM postgres:10

COPY . .

ENV TZ=Asia/Kuala_Lumpur
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV POSTGRES_USER irsyadmhdilham
ENV POSTGRES_PASSWORD Irsyad89
ENV POSTGRES_DB squalify