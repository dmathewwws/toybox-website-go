FROM golang:1.6

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y

RUN cd /tmp && wget https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_amd64.deb
RUN cd /tmp && dpkg -i hugo*.deb

ADD . /src
WORKDIR /src
