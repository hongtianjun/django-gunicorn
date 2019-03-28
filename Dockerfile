#
FROM python:3.7.3-alpine3.9
LABEL maintainer="https://github.com/hongtianjun/"


RUN apk update && apk add --no-cache \
        libuuid \
        pcre \
        mailcap \
        gcc \
        libc-dev \
        linux-headers \
        pcre-dev \
        libffi-dev \
		mariadb-dev \
	&& pip install --no-cache-dir -U django djangorestframework Flask requests mysqlclient six gunicorn gevent \
    && rm -rf /var/cache/apk/* \
    && rm -rf /tmp/src \
    && rm -rf /tmp/*


WORKDIR /code

EXPOSE 8000

COPY pip.conf /root/.pip/pip.conf
COPY gunicorn.conf  /etc/gunicorn/gunicorn.conf
COPY server.py  /code
RUN mkdir /code/logs

    
CMD ["gunicorn", "-c", "/etc/gunicorn/gunicorn.conf", "server:app"]
