FROM python:3

RUN apt-get update
	
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

COPY . /app

WORKDIR /app/projects/api

ENTRYPOINT [ "python" ]

CMD [ "api.py" ]