#getting base image alpine to run backup script
FROM alpine:latest

RUN apk update && apk add bash && apk add postgresql-client

RUN mkdir -p /scripts
COPY backup.sh /scripts
WORKDIR /scripts
RUN chmod +x backup.sh
CMD ["./script.sh"]
