FROM nginx:alpine
RUN apk add --no-cache openssl
RUN curl -fsSL https://get.acme.sh | sh
RUN /root/.acme.sh/acme.sh --upgrade --auto-upgrade
EXPOSE 443