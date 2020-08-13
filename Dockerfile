FROM golang:1.14
MAINTAINER mayidudu
COPY ./gen.sh /go/src/gen.sh
COPY ./dudu_controller /go/src/dudu_controller
RUN sh /go/src/gen.sh
