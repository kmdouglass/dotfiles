#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
REPO_ROOT="$(cd "$SCRIPT_DIR/.." && pwd)"
SECRETS="$REPO_ROOT/.private/lebpc39.secrets"
CONFIG_SRC="$REPO_ROOT/configs/configuration.nix.lebpc39"

if [[ ! -f "$SECRETS" ]]; then
    echo "Error: secrets file not found: $SECRETS" >&2
    exit 1
fi

source "$SECRETS"

: "${IP_ADDRESS:?IP_ADDRESS not set in $SECRETS}"
: "${DEFAULT_GATEWAY:?DEFAULT_GATEWAY not set in $SECRETS}"
: "${NAMESERVER_1:?NAMESERVER_1 not set in $SECRETS}"
: "${NAMESERVER_2:?NAMESERVER_2 not set in $SECRETS}"

TMP=$(mktemp)
trap 'rm -f "$TMP"' EXIT

sed \
    -e "s/w\.w\.w\.w/$IP_ADDRESS/g" \
    -e "s/x\.x\.x\.x/$DEFAULT_GATEWAY/g" \
    -e "s/y\.y\.y\.y/$NAMESERVER_1/g" \
    -e "s/z\.z\.z\.z/$NAMESERVER_2/g" \
    "$CONFIG_SRC" > "$TMP"

scp "$TMP" douglass@lebpc39:/tmp/configuration.nix
ssh -t douglass@lebpc39 'sudo mv /tmp/configuration.nix /etc/nixos/configuration.nix && sudo nixos-rebuild switch'
