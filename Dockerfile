# Stage 01: Build
ARG IMAGE_TAG=latest
FROM ubuntu:$IMAGE_TAG AS builder

# labels for docker image
LABEL maintainer="Anupam Yadav"
LABEL email="anupaminit@gmail.com"

ARG USERNAME=python
ARG GROUPNAME=$USERNAME
ARG USERID=1100
ARG GROUPID=$USERID

# check the current user and create a new user
RUN whoami
RUN groupadd --gid $GROUPID $GROUPNAME && useradd --uid $USERID --gid $GROUPID -m $USERNAME

# Install the tools required for the project
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv

# Copy the entire project files to a directory
COPY python /app

# Install all the required python packages
RUN pip3 install --no-cache-dir --break-system-packages -r /app/requirements.txt

# Stage 02: Run
FROM python:3.10-slim

ARG USERNAME=python
ARG GROUPNAME=$USERNAME
ARG USERID=1100
ARG GROUPID=$USERID

# check the current user and create a new user
RUN whoami
RUN groupadd --gid $GROUPID $GROUPNAME && useradd --uid $USERID --gid $GROUPID -m $USERNAME

COPY --from=builder /app /app

# Switch to project directory
WORKDIR /app

# Chnage the user to newly created user
USER $USERNAME
RUN whoami

# Run the main application file on container startup. 
CMD ["python3", "run.py"]