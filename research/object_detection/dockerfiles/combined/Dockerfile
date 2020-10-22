FROM tensorflow/serving:latest-gpu

ARG DEBIAN_FRONTEND=noninteractive

EXPOSE 8501
EXPOSE 8500

ENV LANG C.UTF-8
# Install apt dependencies
RUN apt-get update && apt-get install -y \
    git \
    gpg-agent \
    python3-pip \
    python3-cairocffi \
    protobuf-compiler \
    python3-pil \
    python3-lxml \
    python3-tk \
    wget \
    curl 


# Add new user to avoid running as root
RUN useradd -ms /bin/bash tensorflow
USER tensorflow
WORKDIR /home/tensorflow

# Copy this version of of the model garden into the image
COPY --chown=tensorflow . /home/tensorflow/models

# Compile protobuf configs
RUN (cd /home/tensorflow/models/research/ && protoc object_detection/protos/*.proto --python_out=.)
WORKDIR /home/tensorflow/models/research/

RUN cp object_detection/packages/tf2/setup.py ./
ENV PATH="/home/tensorflow/.local/bin:${PATH}"

RUN python3 -m pip install -U pip
RUN python3 -m pip install .

ENV TF_CPP_MIN_LOG_LEVEL 3

