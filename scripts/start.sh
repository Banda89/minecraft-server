#!/bin/bash
set -e

# In Projektwurzel wechseln
cd "$(dirname "$0")/.."

# Konfiguration laden
source ./config/config.sh

# Debug-Ausgabe (optional, aber sehr hilfreich)
echo "Starting mailservice with:"
echo "  MAIL_DOMAIN=${MAIL_DOMAIN}"
echo "  MAIL_HOSTNAME=${MAIL_HOSTNAME}"

# Sicherheitscheck (verhindert leere Variablen)
if [ -z "$MAIL_DOMAIN" ] || [ -z "$MAIL_HOSTNAME" ]; then
  echo "ERROR: MAIL_DOMAIN oder MAIL_HOSTNAME ist nicht gesetzt"
  exit 1
fi

# Docker Compose starten
docker compose build
docker compose up -d

# Logs anzeigen
echo "Displaying logs of containers..."
docker compose logs -f

