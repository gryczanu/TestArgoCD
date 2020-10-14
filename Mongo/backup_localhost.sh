#!/bin/bash

set -e

echo "creating backup: $(date)"

DATE=$(date +%Y%m%d_%H%M%S)
FILE="/home/urszula/test/Mongo/backup-$DATE.tar.gz"

mongodump --host 127.0.0.1:27017 --gzip --archive=$FILE

echo "backup created: $(date)"
