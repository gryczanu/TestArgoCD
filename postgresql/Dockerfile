#getting base image alpine to run backup backup
FROM alpine:latest

RUN apk update && apk add bash && apk add postgresql-client

RUN mkdir -p /backups
COPY backup.sh /backups
WORKDIR /backups
RUN chmod +x backup.sh
CMD ["./backup.sh"]
