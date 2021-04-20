# pull official base image
FROM python:3.9.0-slim-buster

RUN apt-get update
RUN apt install -y netcat
# set working directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# add and install requirements
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app
COPY . .

# run server
COPY ./entrypoint.sh .
RUN chmod +x /usr/src/app/entrypoint.sh
