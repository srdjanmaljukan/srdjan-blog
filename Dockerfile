# syntax=docker/dockerfile:1

FROM python:3.8-slim-buster

RUN mkdir -p -- /root/app/instance /root/app/static /root/app/templates
WORKDIR /root/app

COPY main.py /root/app/main.py
COPY forms.py /root/app/forms.py
COPY requirements.txt /root/app/requirements.txt
COPY .gitignore /root/app/.gitignore
COPY /instance/* root/app/instance/
COPY /static/* root/app/static/
COPY /templates/* root/app/templates/

RUN pip install -r requirements.txt

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0"]

EXPOSE 3000
