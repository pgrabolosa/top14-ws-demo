FROM python:3-alpine

WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

COPY *.py /app
CMD ["gunicorn", "-w", "1", "-b", "0.0.0.0:80", "main:app"]
