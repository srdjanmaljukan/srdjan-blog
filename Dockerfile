FROM python:3.10

RUN mkdir -p -- /root/app/instance /root/app/static /root/app/templates
WORKDIR /root/app

COPY main.py /root/app/main.py
COPY forms.py /root/app/forms.py
COPY /instance/* root/app/instance/
COPY /static/* root/app/static/
COPY /templates/* root/app/templates/

RUN pip install -r requirements.txt

CMD ["flask", "run", "--host=0.0.0.0"]