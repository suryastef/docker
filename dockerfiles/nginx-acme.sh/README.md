# Nginx-acme.sh

Nginx container with acme.sh installed in /root/.acme.sh

## Usage

Bring up container and run the nginx daemon (change example.com to your registered domain):

```
docker run -d --name nginx-acmesh -p 80:80 -p 443:443 -e DOMAIN=example.com -v $(pwd)/acme.sh:/root/.acme.sh nginx:alpine
```

Add your domain configuration to nginx:

```
docker exec -ti nginx-acmesh sed -i 's/localhost/'$DOMAIN'/g' /etc/nginx/conf.d/default.conf
```

Issue certificate from let's encrypt:

```
docker exec -ti nginx-acmesh /root/.acme.sh/acme.sh --issue --nginx -d $DOMAIN
```

---

Reference:

- https://github.com/acmesh-official/acme.sh