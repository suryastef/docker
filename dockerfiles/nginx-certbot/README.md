# Dockerized Nginx with Certbot

Nginx as web server and reverse proxy, with Certbot to generate SSL certificate from let's encrypt

Usage:

```
certbot --nginx -d example.com -d www.example.com --agree-tos --no-eff-email -m user@example.com --redirect
```

Reference:

- https://geko.cloud/nginx-and-ssl-with-certbot-in-docker-alpine/