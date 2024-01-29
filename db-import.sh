#!/bin/bash

# File: db-import.sh

### ---set-me-up---
HOST="http://localhost:42877"
KEY="glsa_urtXfVo0rtxcZngHzY2Onllyjbx6SFY9_z7FrdsWa"
### ---set-me-up---

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

for folder in $SCRIPT_DIR/folders/*json ; do
  curl -X POST  -H "Authorization: Bearer $KEY"  ${HOST}/api/folders -H 'Content-Type: application/json'  --data @${folder}
  echo Folder ${folder} created.
done

for dash in $SCRIPT_DIR/dashboards/*json ; do
  curl -X POST  -H "Authorization: Bearer $KEY"  ${HOST}/api/dashboards/db -H 'Content-Type: application/json'  --data @${dash}
  echo Dasboard ${dash} created.
done
