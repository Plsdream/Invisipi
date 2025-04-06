#!/bin/bash

echo "[+] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[+] Installing dependencies..."
sudo apt install -y hostapd dnsmasq iptables-persistent wireguard unbound tor curl

echo "[+] Stopping default services (will configure manually)..."
sudo systemctl stop hostapd
sudo systemctl stop dnsmasq

echo "[+] Enabling IP forwarding..."
sudo sh -c 'echo 1 > /proc/sys/net/ipv4/ip_forward'
sudo sed -i 's/#net.ipv4.ip_forward=1/net.ipv4.ip_forward=1/' /etc/sysctl.conf

echo "[+] Copying config files..."
cp ./config/hostapd.conf /etc/hostapd/hostapd.conf
cp ./config/dnsmasq.conf /etc/dnsmasq.conf
cp ./config/unbound.conf /etc/unbound/unbound.conf
cp ./config/wg0.conf /etc/wireguard/wg0.conf
cp ./firewall/rules.v4 /etc/iptables/rules.v4

echo "[+] Setting up services..."
systemctl unmask hostapd
systemctl enable hostapd
systemctl enable dnsmasq
systemctl enable wg-quick@wg0
systemctl enable unbound
systemctl enable tor

echo "[+] Setting permissions..."
chmod 600 /etc/wireguard/wg0.conf

echo "[+] Setup complete. Please reboot your Pi."
