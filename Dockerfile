FROM ubuntu
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv
COPY . /app
WORKDIR /app
RUN pip3 install -r requirements.txt
ENTRYPOINT python3 run.py