FROM python:3.6
ENV PYTHONUNBUFFERED 1

MAINTAINER zhanghai <zhanghhd@163.com>

#RUN git clone https://github.com/zhengze/zblog.git
RUN mkdir -p /code/db
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com \
&& pip install uwsgi -i http://mirrors.aliyun.com/pypi/simple --trusted-host mirrors.aliyun.com
ADD . /code/

