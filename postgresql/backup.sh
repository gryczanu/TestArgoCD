#!/bin/bash
#postrgesql backup

set -e

echo "creating backup: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE_NAME="backup-$DATE.sql.gz"
FILE="/scripts/$FILE_NAME"

echo "$PGPASS" > /root/.pgpass && chmod 600 /root/.pgpass
pg_dump -U $USERNAME -h $HOSTNAME $DATABASE| gzip > $FILE_NAME
curl -X PUT -T ./$FILE_NAME -H "x-ms-date: $(date -u)" -H "x-ms-blob-type: BlockBlob" "https://$STORAGE_ACCOUNT.blob.core.windows.net/$CONTAINER_NAME/$FILE_NAME?$SAS_TOKEN"

rm $FILE

echo "backup created: $(date)"
