FROM apache/nifi:1.12.1
COPY --chown=nifi:nifi ./jdbc-drivers/ /opt/nifi/
COPY --chown=nifi:nifi start.sh /opt/nifi/scripts/start.sh
COPY --chown=nifi:nifi common.sh /opt/nifi/scripts/common.sh
USER nifi
RUN mkdir -p /opt/nifi/nifi-tmp/conf
COPY ./conf /opt/nifi/nifi-current/conf/
RUN cp -R /opt/nifi/nifi-current/conf/* /opt/nifi/nifi-tmp/conf/
