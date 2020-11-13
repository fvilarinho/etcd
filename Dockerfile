FROM ghcr.io/concepting-com-br/base-image:1.0.0

LABEL maintainer="fvilarinho@concepting.com.br"

ENV APP_NAME=etcd 

ENV ETCD_LISTEN_CLIENT_URLS="http://0.0.0.0:2379"
ENV ETCD_ADVERTISE_CLIENT_URLS="http://0.0.0.0:2379"
ENV ETCD_DATA_DIR=${DATA_DIR}

USER root

RUN apk update && \
    apk --no-cache \ 
        --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing \ 
        add etcd \
            etcd-ctl

COPY bin/* ${BIN_DIR}/
COPY etc/* ${ETC_DIR}/

RUN chmod +x ${BIN_DIR}/*.sh && \ 
    ln -s ${BIN_DIR}/startup.sh /entrypoint.sh
    
EXPOSE 2379

USER user
    
ENTRYPOINT ["/entrypoint.sh"]