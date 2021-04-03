# Use imutable image tags rather than mutable tags (like ubuntu:18.04)
FROM ubuntu:bionic-20200807

ENV LANG=C.UTF-8

RUN mkdir /ansible
WORKDIR /ansible

COPY . .
RUN apt update -y && \
    apt install -y \
    libssl-dev python3-dev sshpass apt-transport-https jq moreutils \
    ca-certificates curl gnupg2 software-properties-common python3-pip rsync && \
    /usr/bin/python3 -m pip install pip -U && \
    python3 -m pip install -r requirements.txt && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 1

CMD ["/bin/bash"]