#!/usr/bin/env bash
set -e

# Minimal uninstaller for iio-dsu-bridge
SERVICE_NAME="iio-dsu-bridge"
SERVICE_FILE="$HOME/.config/systemd/user/${SERVICE_NAME}.service"
BIN_PATH="$HOME/.local/bin/iio-dsu-bridge"

echo "==> Stopping and disabling service..."
systemctl --user disable --now "${SERVICE_NAME}.service" || true

echo "==> Removing files..."
rm -f "$SERVICE_FILE"
rm -f "$BIN_PATH"

echo "==> Reloading systemd user daemon..."
systemctl --user daemon-reload || true

echo "==> Uninstall complete."
