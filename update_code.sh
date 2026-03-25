#!/bin/bash
set -e

DEPLOY_DIR="/home/azureuser/deploy-temp"
ENV_FILE="/home/azureuser/.env"

echo "[1] Navigating to deploy directory"
cd $DEPLOY_DIR

echo "[1a] Copying environment secrets"
if [ -f "$ENV_FILE" ]; then
  cp "$ENV_FILE" "$DEPLOY_DIR/.env"
else
  echo "ERROR: $ENV_FILE not found. Create it on the server with the required secrets."
  exit 1
fi

echo "[2] Stopping existing containers"
docker compose down

echo "[3] Pulling latest images"
docker compose pull

echo "[4] Building and starting containers"
docker compose up --build -d

echo "[5] Deployment complete"
docker ps