FROM alpine
LABEL maintainer="Florian Baader <florian.baader@selectcode.de>"

RUN apk add ruby-dev gcc make g++ ruby-rdoc --no-cache
RUN gem install kubernetes-deploy


ENV KUBECTL_VERSION v1.12.5

RUN apk add --no-cache bash openssl ca-certificates curl wget jq gettext git && \
    curl -L https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl -o /usr/local/bin/kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
