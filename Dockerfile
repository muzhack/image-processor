FROM python:3.6-slim
MAINTAINER MuzHack Team <contact@muzhack.com>

WORKDIR /app
ENTRYPOINT ["./project-processor.py"]
EXPOSE 10000

RUN apt-get update && apt-get install -y build-essential libjpeg-dev zlib1g-dev libtiff-dev
RUN apt-get install -y xvfb wkhtmltopdf

# Cache dependencies in order to speed up builds
COPY requirements.txt requirements.txt
RUN pip install -U pip
RUN pip install -U -r requirements.txt

RUN apt-get -y remove build-essential && apt-get autoremove -y && apt-get clean

COPY ./ .
