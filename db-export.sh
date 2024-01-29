#!/bin/bash

# File: db-export.sh

### ---set-me-up---
HOST="http://localhost:42877"
KEY="glsa_nD1Kk1sNruwY46bYv5Mr61DexjDiTfqH_ae90b216"
###

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if [ ! -d $SCRIPT_DIR/dashboards ] ; then
    mkdir -p $SCRIPT_DIR/dashboards
fi
if [ ! -d $SCRIPT_DIR/folders ] ; then
    mkdir -p $SCRIPT_DIR/folders
fi


for dash in $(curl -s -k -H "Authorization: Bearer $KEY" $HOST/api/search\?query\=\& | jq -r '.[] | select(.type == "dash-db") | .uid'); do
  curl -s -k -H "Authorization: Bearer $KEY" $HOST/api/dashboards/uid/$dash \
    | jq '. |= (.folderUid=.meta.folderUid) |del(.meta) |del(.dashboard.id) + {overwrite: true}' \
    > dashboards/${dash}.json
  echo "Dashboard: ${dash} saved."
done

for folder in $(curl -s -k -H "Authorization: Bearer $KEY" $HOST/api/folders |  jq -r '.[] | .uid'); do
  curl -s -k -H "Authorization: Bearer $KEY" $HOST/api/folders/$folder \
    | jq '. |del(.id) + {overwrite: true}' \
    > folders/${folder}.json
  echo "Folder: ${folder} saved."
done
