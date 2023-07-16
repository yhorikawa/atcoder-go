FROM golang:1.20.5

RUN apt update \
  && apt install -y vim \
  python3 \
  python3-pip \
  nodejs \
  npm \
  && pip3 install -U pip \
  && pip3 install online-judge-tools \
  && npm install -g atcoder-cli

RUN mkdir -p /root/.config/atcoder-cli-nodejs
COPY golang /root/.config/atcoder-cli-nodejs/golang
RUN acc config default-test-dirname-format test \
  && acc config default-task-choice all \
  && acc config default-template golang

ENV GO111MODULE on
WORKDIR /go/src/work

RUN go install -v golang.org/x/tools/gopls@latest \
  && go install -v github.com/ramya-rao-a/go-outline@v0.0.0-20210608161538-9736a4bde949
