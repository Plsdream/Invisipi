import shutil
import os

# Define project structure
project_root = "/mnt/data/pi-privacy-router"
dirs = [
    "config",
    "firewall",
    "services",
    "scripts",
    "webui"
]

files = {
    "README.md": "# Pi Privacy Router\n\nA plug-and-play Raspberry Pi router for anonymity and privacy.\n",
    "install.sh": "#!/bin/bash\n# Installation script placeholder\necho 'Running setup...'\n",
    "config/hostapd.conf": "# Hostapd config placeholder\n",
    "config/dnsmasq.conf": "# Dnsmasq config placeholder\n",
    "config/wg0.conf": "# WireGuard config placeholder\n",
    "config/unbound.conf": "# Unbound config placeholder\n",
    "firewall/rules.v4": "# iptables rules placeholder\n",
    "services/wg-quick@wg0.service": "# WireGuard systemd service placeholder\n",
    "services/tor.service": "# Tor systemd service placeholder\n",
    "scripts/start-vpn.sh": "#!/bin/bash\necho 'Starting VPN...'\n",
    "scripts/stop-vpn.sh": "#!/bin/bash\necho 'Stopping VPN...'\n",
    "scripts/tor-toggle.sh": "#!/bin/bash\necho 'Toggling Tor...'\n",
    "webui/index.html": "<html><body><h1>Privacy Router UI</h1></body></html>\n"
}

# Create directories
for d in dirs:
    os.makedirs(os.path.join(project_root, d), exist_ok=True)

# Create files with content
for path, content in files.items():
    full_path = os.path.join(project_root, path)
    with open(full_path, "w") as f:
        f.write(content)

# Make shell scripts executable
for script in ["install.sh", "scripts/start-vpn.sh", "scripts/stop-vpn.sh", "scripts/tor-toggle.sh"]:
    os.chmod(os.path.join(project_root, script), 0o755)

# Zip the folder
shutil.make_archive(project_root, 'zip', project_root)

# Return the zip file path
project_root + ".zip"
