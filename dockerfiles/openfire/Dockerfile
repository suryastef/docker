FROM openjdk:11-jre-slim
WORKDIR /root
RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install curl tar -y && \
    curl -sLO $(curl -s https://api.github.com/repos/igniterealtime/Openfire/releases | grep browser_download_url | grep '.tar.gz' | head -n 1 | cut -d '"' -f 4) &&\
    tar -xzf $(curl -sw "%{filename_effective}" -LO $(curl -s https://api.github.com/repos/igniterealtime/Openfire/releases | grep browser_download_url | grep '.tar.gz' | head -n 1 | cut -d '"' -f 4)) -C /opt && \
    rm /root/$(curl -sw "%{filename_effective}" -LO $(curl -s https://api.github.com/repos/igniterealtime/Openfire/releases | grep browser_download_url | grep '.tar.gz' | head -n 1 | cut -d '"' -f 4))
EXPOSE 3478/tcp 3479/tcp 5222/tcp 5223/tcp 5229/tcp 5275/tcp 5276/tcp 5262/tcp 5263/tcp 7070/tcp 7443/tcp 7777/tcp 9090/tcp 9091/tcp
CMD /opt/openfire/bin/openfire run