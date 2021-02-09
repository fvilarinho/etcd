FROM ghcr.io/concepting-com-br/base-image:1.0.0

LABEL maintainer="fvilarinho@concepting.com.br"

ENV SETTINGS_HOSTNAME=0.0.0.0
ENV SETTINGS_PORT=2379
ENV SETTINGS_URL=http://${SETTINGS_HOSTNAME}:${SETTINGS_PORT}

ENV ETCD_LISTEN_CLIENT_URLS="${SETTINGS_URL}"
ENV ETCD_ADVERTISE_CLIENT_URLS="${SETTINGS_URL}"
ENV ETCD_DATA_DIR=${DATA_DIR}

USER root

RUN apk update && \
    apk --no-cache \ 
        --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \ 
        add etcd

COPY bin/startup.sh ${BIN_DIR}/${APP_NAME}-startup.sh
COPY bin/install.sh ${BIN_DIR}/${APP_NAME}-install.sh
COPY etc/settings.json ${ETC_DIR}/etcd.json
COPY .env ${ETC_DIR}/

RUN chmod +x ${BIN_DIR}/${APP_NAME}-*.sh
    
EXPOSE 2379

USER user
    
CMD ["${BIN_DIR}/${APP_NAME}-startup.sh"]