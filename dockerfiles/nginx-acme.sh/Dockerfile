FROM nginx:alpine
RUN apk add --no-cache openssl socat
RUN curl https://get.acme.sh | sh
VOLUME /root/.acme.sh
EXPOSE 443