FROM alpine:3.18.3
RUN apk add --update --no-cache docker python3 curl which bash
RUN curl https://sdk.cloud.google.com | bash -s -- --disable-prompts --install-dir=/opt/
ENV PATH=$PATH:/opt/google-cloud-sdk/bin/
