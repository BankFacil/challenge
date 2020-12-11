FROM python:3.8-alpine

LABEL Author="Diego Ferreira"
LABEL E-mail="diegoferreirajava@gmail.com"
LABEL version="1.0"

WORKDIR /usr/src/app

COPY . .

RUN pip3 install -r requirements.txt

ENTRYPOINT ["/usr/src/app/bootstrap.sh"]