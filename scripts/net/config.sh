#!/bin/bash

set -e

# Create network configuration file
cat << EOF > ${TARGET_DIR}/etc/network/interfaces
auto lo
iface lo inet loopback

auto eth0
iface eth0 inet static
    address 10.0.0.240
    netmask 255.255.255.0
    gateway 10.0.0.1
EOF

echo "nameserver 8.8.8.8" > ${TARGET_DIR}/etc/resolv.conf

exit $?
