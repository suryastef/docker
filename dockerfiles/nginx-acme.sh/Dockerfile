FROM nginx:alpine
RUN apk add --no-cache openssl
RUN curl https://get.acme.sh | sh
VOLUME /root/.acme.sh
EXPOSE 443