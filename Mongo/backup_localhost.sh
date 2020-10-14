#!/bin/bash

set -e

echo "creating backup: $(date)"

DATABASE_HOST=${DATABASE_HOST:-localhost}
DB_PORT=${DB_PORT:-27017}

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/home/urszula/test/Mongo/backup-$DATE.tar.gz"

mongodump --host $DATABASE_HOST:$DB_PORT --gzip --archive=$FILE
curl -X PUT -T ./backup-$DATE.tar.gz -H "x-ms-date: $(date -u)" -H "x-ms-blob-type: BlockBlob" "https://pmdevsa01.blob.core.windows.net/t-trade-desk/backup-$DATE.tar.gz?se=2020-12-31&sp=racwdl&sv=2018-11-09&sr=c&sig=3xUVQQMsAXLYQ67d6b44ukLdb6JOwrqbr/DgoQ3VEu8%3D"

echo "backup created: $(date)"
