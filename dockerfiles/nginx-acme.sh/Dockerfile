FROM nginx:alpine
RUN apk add --no-cache openssl > /dev/null 2>&1
RUN curl https://get.acme.sh | sh > /dev/null 2>&1
VOLUME /root/.acme.sh
EXPOSE 443