#!/bin/bash

echo "[*] Updating and upgrading the system..."
sudo apt update && sudo apt upgrade -y

echo "[*] Installing common dependencies..."
sudo apt install -y git curl python3-pip unzip build-essential wget gnupg net-tools

echo "[*] Creating Red Team tools directory..."
mkdir -p ~/RedTeam && cd ~/RedTeam

# --- Reconnaissance / OSINT ---
echo "[*] Cloning SpiderFoot..."
git clone https://github.com/smicallef/spiderfoot.git

echo "[*] Installing Maltego (manual setup required)"
echo "[!] Visit https://www.maltego.com/download/ for downloading and installing Maltego manually."

echo "[*] Installing FOCA (Windows only)"
echo "[!] FOCA is Windows-based. Skipping."

echo "[*] Installing Datasploit..."
git clone https://github.com/DataSploit/datasploit.git && cd datasploit && pip3 install -r requirements.txt && cd ..

# --- Initial Access / Phishing ---
echo "[*] Cloning Gophish..."
wget https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip
unzip gophish-v0.12.1-linux-64bit.zip -d gophish

echo "[*] Cloning Evilginx2..."
git clone https://github.com/kgretzky/evilginx2.git && cd evilginx2 && make && cd ..

# --- Credential Access & Lateral Movement ---
echo "[*] Cloning Mimikatz..."
git clone https://github.com/gentilkiwi/mimikatz.git

echo "[*] Installing CrackMapExec..."
pip3 install crackmapexec

echo "[*] Cloning Responder..."
git clone https://github.com/lgandx/Responder.git

echo "[*] Cloning Impacket..."
git clone https://github.com/fortra/impacket.git && cd impacket && pip3 install . && cd ..

echo "[*] Cloning BloodHound & SharpHound..."
git clone https://github.com/BloodHoundAD/BloodHound.git
mkdir SharpHound && cd SharpHound && wget https://github.com/BloodHoundAD/BloodHound/raw/master/Collectors/SharpHound.exe && cd ..

# --- Post-Exploitation & C2 ---
echo "[*] Cloning Covenant..."
git clone https://github.com/cobbr/Covenant

echo "[*] Cloning Empire..."
git clone https://github.com/BC-SECURITY/Empire.git && cd Empire && ./setup/install.sh && cd ..

echo "[*] Cloning Sliver C2..."
git clone https://github.com/BishopFox/sliver.git && cd sliver && make build && cd ..

echo "[*] Cloning Mythic..."
git clone https://github.com/its-a-feature/Mythic.git

echo "[*] Cloning Nishang..."
git clone https://github.com/samratashok/nishang.git

# --- Evasion & Payload Generation ---
echo "[*] Cloning Donut..."
git clone https://github.com/TheWover/donut.git && cd donut && make && cd ..

echo "[*] Cloning PEzor..."
git clone https://github.com/phra/PEzor.git

echo "[*] Cloning ScareCrow..."
git clone https://github.com/optiv/ScareCrow.git

# --- Tunneling & Covert Channels ---
echo "[*] Installing Chisel..."
CHISEL_VERSION=$(curl -s https://api.github.com/repos/jpillora/chisel/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/jpillora/chisel/releases/download/${CHISEL_VERSION}/chisel_$(uname -s)_amd64.gz
gunzip chisel_$(uname -s)_amd64.gz && chmod +x chisel_$(uname -s)_amd64 && mv chisel_$(uname -s)_amd64 chisel

echo "[*] Installing Socat..."
sudo apt install -y socat proxychains4

echo "[*] Cloning Ligolo-ng..."
git clone https://github.com/nicocha30/ligolo-ng.git && cd ligolo-ng && make && cd ..

echo "[*] Cloning dnscat2..."
git clone https://github.com/iagox86/dnscat2.git

# --- For Exfiltration & Reporting ---
echo "[*] Installing rclone..."
curl https://rclone.org/install.sh | sudo bash

echo "[*] Cloning LaZagne..."
git clone https://github.com/AlessandroZ/LaZagne.git

echo "[*] Installing PingCastle..."
wget https://github.com/vletoux/pingcastle/releases/latest/download/PingCastle.exe -O PingCastle.exe

echo "[*] Red Team tool installation complete!"
