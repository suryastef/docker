FROM alpine:3.18.3
RUN apk update && apk add --no-cache docker git python3 curl which bash
RUN curl https://sdk.cloud.google.com | bash -s -- --disable-prompts
ENV PATH=$PATH:/root/google-cloud-sdk/bin

