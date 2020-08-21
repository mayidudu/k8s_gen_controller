FROM golang:1.14
MAINTAINER mayidudu
ENV GOROOT /go
COPY ./gen.sh /go/src/gen.sh
COPY ./dudu_controller /go/src/dudu_controller
COPY ./dudu_controller /usr/local/go/src/dudu_controller
RUN cd /go/src \
    && go get -u k8s.io/apimachinery/pkg/apis/meta/v1  \
    && go get -u k8s.io/code-generator/...
RUN cd /go/src/k8s.io/code-generator \
    && ./generate-groups.sh all \
    dudu_controller/pkg/client \
    dudu_controller/pkg/apis \
    dudu:v1
