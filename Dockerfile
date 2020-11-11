FROM ghcr.io/concepting-com-br/base-image:latest

LABEL maintainer="fvilarinho@innovativethinking.com.br"

ENV ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"
ENV ETCD_ADVERTISE_CLIENT_URLS="http://0.0.0.0:2379"
ENV ETCD_DATA_DIR=${DATA_DIR}

RUN apk update && \
    apk --no-cache \ 
        --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \ 
        add etcd \
            etcd-ctl

COPY src/main/resources/bin/* ${BIN_DIR}/
COPY src/main/resources/etc/* ${ETC_DIR}/

RUN chmod +x ${BIN_DIR}/*.sh && \
    ln -s ${BIN_DIR}/startup.sh /entrypoint.sh
    
ENTRYPOINT ["/entrypoint.sh"]