#!/bin/bash
set -e

# In Projektwurzel wechseln
cd "$(dirname "$0")/.."

# Konfiguration laden
source ./config/config.sh

# Docker Compose starten
docker compose build
docker compose up -d

# Logs anzeigen
echo "Displaying logs of containers..."
docker compose logs -f

