#!/bin/bash

set -e

echo "creating backup: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE_NAME="backup-$DATE.tar.gz"
FILE="/scripts/$FILE_NAME"

mongodump --uri=mongodb://$DATABASE_URI --gzip --archive=$FILE
curl -X PUT -T ./$FILE_NAME -H "x-ms-date: $(date -u)" -H "x-ms-blob-type: BlockBlob" "https://$STORAGE_ACCOUNT.blob.core.windows.net/$CONTAINER_NAME/$FILE_NAME?$SAS_TOKEN"

rm $FILE

echo "backup created: $(date)"
