FROM alpine

RUN apk update && apk add tzdata diffutils curl && cp -r -f /usr/share/zoneinfo/Asia/Shanghai /etc/localtime && apk del tzdata

WORKDIR /grpc_store
COPY ./bin/cortex-mysql-store /grpc_store/cortex-mysql-store
CMD ["./cortex-mysql-store","--config.file=grpc-mysql-store.yaml"]
