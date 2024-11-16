FROM public.ecr.aws/docker/library/python:3.8-slim

WORKDIR /src

COPY ./analytics/requirements.txt requirements.txt

RUN apt update -y
RUN apt install build-essential libpq-dev -y
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r requirements.txt

COPY ./analytics .

CMD python app.py