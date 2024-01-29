# Grafana Dashboard Export/Import Scripts

These scripts facilitate the export and import of dashboards from one Grafana instance to another. They utilize Grafana's HTTP API to accomplish this task.

## Usage

### Export Script (`db-export.sh`)

This script exports dashboards and their associated folders from a source Grafana instance.

1. Set up the following variables in the script:
   - `HOST`: URL of the source Grafana instance.
   - `KEY`: API key for authentication.

2. Run the script:
   ```bash
   bash db-export.sh
   bash db-import.sh

