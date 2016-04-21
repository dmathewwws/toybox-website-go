FROM golang:1.6

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install apt-utils -y

RUN cd /tmp && wget https://github.com/spf13/hugo/releases/download/v0.15/hugo_0.15_amd64.deb
RUN cd /tmp && dpkg -i hugo*.deb

ADD . /src
WORKDIR /src

# Expose default hugo port
EXPOSE 80

# By default, serve site
ENV HUGO_BASE_URL http://toysinboxes.com
CMD hugo server \
	--baseUrl=${HUGO_BASE_URL} \
	--port=80 \
	--appendPort=false \
	--bind=0.0.0.0 \
	--disableLiveReload=true
