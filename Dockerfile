FROM ubuntu:22.04

RUN apt-get update \
      && apt-get install -y --no-install-recommends \
       python3 \
       python3-pip \
       curl \
      && mkdir -p /app \
      && useradd -d /app -s /bin/bash app \
      && chown -R app:app /app

COPY /py-app/requirements.txt /app/requirements.txt
RUN pip3 install -r /app/requirements.txt

COPY /py-app/app/app.py /app
WORKDIR /app

USER app

CMD ["python3", "app.py"]
