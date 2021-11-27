FROM python:3.9
MAINTAINER Ajinkya Thite 'ajinkyathite20@gmail.com'

ADD app/web_server.py /
ADD requirements.txt /

RUN apt-get update -y && \  
    apt-get install -y python3-pip python3-dev && \
    pip install --upgrade pip setuptools
RUN pip install -r ./requirements.txt


CMD ["python3", "./web_server.py"]
