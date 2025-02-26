FROM alpine:latest

ENV GO_VERSION 1.18
ENV GOPATH /go
ENV GOROOT /usr/local/go
ENV OLLAMA_MODELS = /app/ollama/models/.ollama
ENV OLLAMA_NUM_THREADS = 4
ENV OLLAMA_DEBUG = 1

RUN apk update && apk add --no-cache \
    bash \
    git \
    curl \
    build-base \
    && rm -rf /var/cache/apk/*

RUN curl -sSL "https://golang.org/dl/go${GO_VERSION}.linux-amd64.tar.gz" | tar -C /usr/local -xz

ENV PATH=$PATH:$GOROOT/bin:$GOPATH/bin

WORKDIR /app

COPY webgollama/ /app/webgollama/
COPY ollama/ /app/ollama/

VOLUME ["/app/openchat"]

RUN chmod +x /app/ollama/start.sh /app/ollama/create.sh

WORKDIR /app/webgollama

CMD ./start.sh & ./create.sh && go run main.go
