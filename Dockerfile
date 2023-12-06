FROM alpine:3.18

ARG VERSION=2.9.0
ARG OS=linux
ARG ARCH=amd64

RUN apk add curl gzip && \
	curl --silent --location "https://github.com/karlderkaefer/cdk-notifier/releases/download/v${VERSION}/cdk-notifier_${OS}_${ARCH}.gz" -o /tmp/cdk-notifier.gz && \
	gunzip /tmp/cdk-notifier.gz && chmod +x /tmp/cdk-notifier && rm -rf /tmp/cdk-notifier.gz && \
	mv /tmp/cdk-notifier /usr/local/bin/cdk-notifier && \
	apk del curl gzip

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
