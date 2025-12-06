FROM ghcr.io/fvilarinho/base-image:1.2.0

LABEL maintainer="fvilarinho@gmail.com"

ENV SETTINGS_HOSTNAME=0.0.0.0
ENV SETTINGS_PORT=2379
ENV SETTINGS_URL=http://${SETTINGS_HOSTNAME}:${SETTINGS_PORT}

ENV ETCD_LISTEN_CLIENT_URLS="${SETTINGS_URL}"
ENV ETCD_ADVERTISE_CLIENT_URLS="${SETTINGS_URL}"
ENV ETCD_DATA_DIR=${DATA_DIR}

USER root

RUN apk update && \
    apk --no-cache add etcd

COPY bin/startup.sh ${BIN_DIR}/child-startup.sh
COPY bin/install.sh ${BIN_DIR}/child-install.sh
COPY etc/settings.json ${ETC_DIR}/etcd.json
COPY .env ${ETC_DIR}/.release

RUN chmod +x ${BIN_DIR}/child-*.sh && \
    chown -R user:group ${HOME_DIR}/ && \
    chmod -R o-rwx ${HOME_DIR}/
    
EXPOSE 2379

USER user
    
CMD ["${BIN_DIR}/child-startup.sh"]