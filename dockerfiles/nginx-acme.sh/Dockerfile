FROM nginx:alpine
RUN apk add --no-cache openssl > /dev/null 2>&1
RUN curl -fsSL https://get.acme.sh | sh > /dev/null 2>&1
RUN /root/.acme.sh/acme.sh --upgrade --auto-upgrade
EXPOSE 443