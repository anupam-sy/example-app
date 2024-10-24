# Stage 01: Build
ARG IMAGE_TAG=3.10-slim
FROM python:$IMAGE_TAG

# Labels for docker image
LABEL maintainer="Anupam Yadav"
LABEL email="anupaminit@gmail.com"

ARG USERNAME=python
ARG GROUPNAME=$USERNAME
ARG USERID=1100
ARG GROUPID=$USERID

# Check the current user and create a new user
RUN whoami
RUN groupadd --gid $GROUPID $GROUPNAME && useradd --uid $USERID --gid $GROUPID -m $USERNAME

# Install the tools required for the project
WORKDIR /app

# Copy the content of source folder (project files) to a directory
COPY python .
RUN pip install --no-cache-dir -r requirements.txt

# Change the user to newly created user and verify it
USER $USERNAME
RUN whoami

# Expose the container port
EXPOSE 4999

# Run the main application file on container startup
CMD ["python3", "run.py"]
