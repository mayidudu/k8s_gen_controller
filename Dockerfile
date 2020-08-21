FROM golang:1.14
MAINTAINER mayidudu
COPY ./dudu_controller /go/src/github.com/dudu_controller
COPY ./dudu_controller /usr/local/go/src/dudu_controller
RUN cd /go/src \
    && go get -u k8s.io/apimachinery/pkg/apis/meta/v1  \
    && go get -u k8s.io/code-generator/...
RUN cd /go/src/k8s.io/code-generator \
    && ./generate-groups.sh all \
    github.com/dudu_controller/pkg/client \
    github.com/dudu_controller/pkg/apis \
    dudu:v1
