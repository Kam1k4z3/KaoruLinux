#!/bin/sh

if [ -z "$1" ]; then
    echo "Usage: $0 <interface>"
    echo "Example: $0 eth0"
    exit 1
fi

INTERFACE=$1

echo "--- Auto-configuration for $INTERFACE ---"

ifconfig "$INTERFACE" up
udhcpc -i "$INTERFACE" -n
echo "Forcing gateaway and IP"
ifconfig "$INTERFACE" 10.0.2.15 netmask 255.255.255.0

route add default gw 10.0.2.2 "$INTERFACE" 2>/dev/null || echo "Route exists"

echo "--- Config completed for $INTERFACE ---"
