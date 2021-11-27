FROM ubuntu:18.04
MAINTAINER Ajinkya Thite 'ajinkyathite20@gmail.com'

ENV PYTHONUNBUFFERED 1S
ENV RUNNING_IN_DOCKER True

RUN apt-get update -y && \  
    apt-get install -y python3-pip python3-dev && \
    pip install --upgrade pip setuptools
COPY ./requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
COPY . /app
ENTRYPOINT ["python", "/app/web_server.py"]
