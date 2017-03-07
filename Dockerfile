FROM ruby:alpine

MAINTAINER Jorge Quilcate <quilcate.jorge@gmail.com>

ENV INDEX=

WORKDIR /opt

RUN apk add --no-cache bash git openssh python make inotify-tools
RUN gem install asciidoctor tilt thread_safe slim
RUN git clone git://github.com/asciidoctor/asciidoctor-reveal.js.git /opt
RUN mkdir /opt/output/

ADD Makefile .
ADD run.sh .
RUN chmod +x run.sh

VOLUME /opt/slides
VOLUME /opt/output

EXPOSE 8000

CMD ./run.sh
