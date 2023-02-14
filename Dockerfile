# Docker file for MyCompany WebApp
FROM ubuntu
MAINTAINER anupam-sy
# Install the tools required for the project
RUN apt-get update && apt-get install -y \
    python3 \
    python3-pip \
    python3-venv
# Copy the entire project files to a directory
COPY . /app
# Switch to project directory
WORKDIR /app
# Install all the required python packages
RUN pip3 install -r requirements.txt
# Run the main application file on container startup. 
ENTRYPOINT python3 run.py