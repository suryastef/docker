FROM nginx:alpine
RUN apk add python3 py3-pip python3-dev build-base libressl-dev musl-dev libffi-dev
RUN pip3 install pip --upgrade
RUN pip install certbot-nginx
RUN mkdir /etc/letsencrypt
COPY default.conf /etc/nginx/conf.d/default.conf