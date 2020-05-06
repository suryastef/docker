FROM centos:7

COPY FirebirdSS-2.1.4.18393-0.i686.rpm /root/

RUN yum install -y /root/FirebirdSS-2.1.4.18393-0.i686.rpm > /dev/null 2>&1 && yum clean all

RUN sed -i '/3050/ s/#//' /opt/firebird/firebird.conf
RUN sed -i 's/3050/3051/g' /opt/firebird/firebird.conf

RUN mkdir /accurate

VOLUME /accurate

COPY security2.fdb /opt/firebird/

EXPOSE 3051

RUN chmod 666 /accurate
RUN chown firebird:firebird /accurate

CMD /opt/firebird/bin/fbguard -f -p /var/run/firebird/default.pid
