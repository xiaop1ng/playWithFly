#!/bin/sh
set -e

echo "=== Deploy Shadowsocks on Fly.io ==="

if ! command -v flyctl >/dev/null 2>&1; then
  echo "Installing flyctl..."
  curl -fsSL https://fly.io/install.sh | sh
fi

flyctl auth whois >/dev/null 2>&1 || flyctl auth login

if ! flyctl apps list | grep -q playwithsh-ss; then
  flyctl apps create playwithsh-ss
fi

echo "Set SSPASSWORD (change from default!)"
flyctl secrets set SSPASSWORD=123456

flyctl deploy --remote-only

echo "Done. Connect: ss://YWVzLTI1Ni1nY206MTIzNDU2@playwithsh-ss.fly.dev:8388"
echo ""
echo "To set a custom password: flyctl secrets set SSPASSWORD=yourpass && flyctl deploy"
