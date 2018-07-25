FROM centos:latest as builder
RUN yum install -y epel-release && \
    yum install -y python-pip && \
    pip install "ansible<2.6"

# provision
# COPY . /code/
COPY . /code/roles/test_role
COPY tests/docker.yaml /code/
WORKDIR /code/
RUN ansible-playbook -i roles/test_role/tests/inventory \
    docker.yaml --connection=local -vv

FROM ubuntu:latest 
# python
RUN apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y python-minimal python-dev python-pip curl && \
  apt-get clean
# ansible
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y gcc libffi-dev libssl-dev joe && \
  apt-get clean
RUN pip install "ansible<2.6"
COPY . /code/roles/test_role
COPY tests/docker.yaml /code/
WORKDIR /code/
RUN ansible-playbook -i roles/test_role/tests/inventory \
    docker.yaml --connection=local -vv
