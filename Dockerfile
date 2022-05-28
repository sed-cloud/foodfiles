FROM ubuntu:18.04

ENV DEBIAN_FRONTEND=noninteractive
RUN apt update
RUN apt upgrade -y
RUN apt install -y software-properties-common
RUN apt-add-repository -y ppa:deadsnakes
RUN apt update
RUN apt install -y build-essential curl git python3.10 python3.10-distutils python3.10-venv python3.10-dev
RUN curl -Ss https://bootstrap.pypa.io/get-pip.py | python3.10
RUN python3.10 -m pip install path
RUN apt install -y libpq-dev

WORKDIR /workarea
COPY . /workarea/

RUN python3.10 -m pip install -r /workarea/requirements.txt 
RUN python3.10 -m pip install -r /workarea/requirements-dev.txt
RUN python3.10 -m pip install -e .
