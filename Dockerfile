FROM python:3
MAINTAINER Paulo Vital "pvital.solutions@yahoo.com"
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
ADD requirements.txt /code/
RUN pip install -r requirements.txt
ADD . /code/
