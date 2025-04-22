#!/bin/bash

echo "[*] Updating system..."
sudo apt update && sudo apt upgrade -y

echo "[*] Installing APT-based tools..."
sudo apt install -y \
nmap \
amass \
theharvester \
gobuster \
dirb \
nikto \
sqlmap \
john \
hydra \
smbclient \
netcat \
metasploit-framework \
dnsrecon \
burpsuite \
enum4linux \
aircrack-ng \
wifite \
hashcat \
python3-pip \
git \
curl \
xclip \
unzip

echo "[*] Installing SecLists..."
sudo apt install seclists -y
ln -s /usr/share/seclists ~/SecLists

echo "[*] Installing PEAS (Linux & Windows Priv Esc scripts)..."
mkdir -p ~/Tools/priv-esc
cd ~/Tools/priv-esc
git clone https://github.com/carlospolop/PEASS-ng.git

echo "[*] Installing Impacket..."
cd ~/Tools
git clone https://github.com/fortra/impacket.git
cd impacket && pip3 install .

echo "[*] Installing BloodHound (only ingestor)..."
cd ~/Tools
git clone https://github.com/BloodHoundAD/BloodHound.git

echo "[*] Installing Chisel (tunneling tool)..."
cd ~/Tools
CHISEL_VERSION=$(curl -s https://api.github.com/repos/jpillora/chisel/releases/latest | grep tag_name | cut -d '"' -f 4)
curl -LO https://github.com/jpillora/chisel/releases/download/${CHISEL_VERSION}/chisel_$(uname -s)_amd64.gz
gunzip chisel_$(uname -s)_amd64.gz
chmod +x chisel_$(uname -s)_amd64
mv chisel_$(uname -s)_amd64 chisel

echo "[*] Installing Binwalk..."
sudo apt install -y binwalk

echo "[*] Installing Volatility (for memory forensics)..."
pip3 install volatility3

echo "[*] Installing Ghidra (manual setup recommended)..."
echo "[!] Download Ghidra from: https://ghidra-sre.org/"

echo "[*] Installing Radare2 and Cutter..."
sudo apt install -y radare2
cd ~/Tools
git clone https://github.com/radareorg/cutter.git

echo "[*] Installing Recon-ng..."
sudo apt install -y recon-ng

echo "[*] Creating ~/Tools directory for all tools..."
mkdir -p ~/Tools

echo "[*] Done! Your system is now armed for hacking"
