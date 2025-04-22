#!/bin/bash

# Exit on error
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

# Function to print status messages
print_status() {
    echo -e "${GREEN}[+]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[!]${NC} $1"
}

print_error() {
    echo -e "${RED}[-]${NC} $1"
}

# Check if running as root
if [ "$EUID" -eq 0 ]; then 
    print_error "Please do not run as root. Run as a normal user with sudo privileges."
    exit 1
fi

# Create tools directory
TOOLS_DIR="$HOME/tools"
mkdir -p "$TOOLS_DIR"
cd "$TOOLS_DIR"

# Update and upgrade the system
print_status "Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

# Install basic dependencies
print_status "Installing basic dependencies..."
sudo apt install -y \
    git curl wget unzip build-essential \
    python3-pip python3-venv \
    golang-go \
    libssl-dev \
    libffi-dev \
    python3-dev \
    ruby-full \
    default-jdk \
    default-jre

# Install Go tools
print_status "Setting up Go environment..."
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
mkdir -p $GOPATH

# ---- Red Team Tools ----
print_status "Installing Red Team Tools..."

# Empire
print_status "Installing Empire..."
git clone https://github.com/BC-SECURITY/Empire.git
cd Empire
./setup/install.sh
cd ..

# Covenant
print_status "Installing Covenant..."
git clone https://github.com/cobbr/Covenant.git
cd Covenant
dotnet build
cd ..

# Sliver
print_status "Installing Sliver..."
git clone https://github.com/BishopFox/sliver.git
cd sliver
make
cd ..

# Mythic
print_status "Installing Mythic..."
git clone https://github.com/its-a-feature/Mythic.git
cd Mythic
./install_docker_ubuntu.sh
cd ..

# CrackMapExec
print_status "Installing CrackMapExec..."
pip3 install crackmapexec

# Mimikatz
print_status "Installing Mimikatz..."
git clone https://github.com/gentilkiwi/mimikatz.git

# BloodHound
print_status "Installing BloodHound..."
git clone https://github.com/BloodHoundAD/BloodHound.git
cd BloodHound
npm install
npm run build
cd ..

# Evilginx2
print_status "Installing Evilginx2..."
git clone https://github.com/kgretzky/evilginx2.git
cd evilginx2
make
cd ..

# Gophish
print_status "Installing Gophish..."
wget https://github.com/gophish/gophish/releases/download/v0.12.1/gophish-v0.12.1-linux-64bit.zip
unzip gophish-v0.12.1-linux-64bit.zip -d gophish
rm gophish-v0.12.1-linux-64bit.zip

# Nishang
print_status "Installing Nishang..."
git clone https://github.com/samratashok/nishang.git

# Ligolo-ng
print_status "Installing Ligolo-ng..."
git clone https://github.com/nicocha30/ligolo-ng.git
cd ligolo-ng
go build -o ligolo-ng
cd ..

# Chisel
print_status "Installing Chisel..."
CHISEL_VERSION=$(curl -s https://api.github.com/repos/jpillora/chisel/releases/latest | grep tag_name | cut -d '"' -f 4)
wget https://github.com/jpillora/chisel/releases/download/${CHISEL_VERSION}/chisel_$(uname -s)_amd64.gz
gunzip chisel_$(uname -s)_amd64.gz
chmod +x chisel_$(uname -s)_amd64
mv chisel_$(uname -s)_amd64 chisel

# Donut
print_status "Installing Donut..."
git clone https://github.com/TheWover/donut.git
cd donut
make
cd ..

# PEzor
print_status "Installing PEzor..."
git clone https://github.com/phra/PEzor.git
cd PEzor
make
cd ..

# ---- CTF/Pentesting Tools ----
print_status "Installing CTF/Pentesting Tools..."

# Nmap
print_status "Installing Nmap..."
sudo apt install -y nmap

# Gobuster
print_status "Installing Gobuster..."
go install github.com/OJ/gobuster/v3@latest

# Dirsearch
print_status "Installing Dirsearch..."
git clone https://github.com/maurosoria/dirsearch.git
cd dirsearch
pip3 install -r requirements.txt
cd ..

# Nikto
print_status "Installing Nikto..."
sudo apt install -y nikto

# Burp Suite
print_status "Installing Burp Suite..."
wget https://portswigger.net/burp/releases/download?product=community&version=2023.4.1&type=Linux -O burpsuite_community_linux_v2023_4_1.sh
chmod +x burpsuite_community_linux_v2023_4_1.sh
./burpsuite_community_linux_v2023_4_1.sh

# SQLMap
print_status "Installing SQLMap..."
git clone https://github.com/sqlmapproject/sqlmap.git
cd sqlmap
pip3 install -r requirements.txt
cd ..

# JohnTheRipper
print_status "Installing JohnTheRipper..."
sudo apt install -y john

# Metasploit
print_status "Installing Metasploit..."
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

# Ghidra
print_status "Installing Ghidra..."
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.2.4_build/ghidra_10.2.4_PUBLIC_20230202.zip
unzip ghidra_10.2.4_PUBLIC_20230202.zip
rm ghidra_10.2.4_PUBLIC_20230202.zip

# Radare2
print_status "Installing Radare2..."
sudo apt install -y radare2

# Wireshark
print_status "Installing Wireshark..."
sudo apt install -y wireshark

# Hydra
print_status "Installing Hydra..."
sudo apt install -y hydra

# Hashcat
print_status "Installing Hashcat..."
sudo apt install -y hashcat

# pwndbg
print_status "Installing pwndbg..."
git clone https://github.com/pwndbg/pwndbg.git
cd pwndbg
./setup.sh
cd ..

# Netcat
print_status "Installing Netcat..."
sudo apt install -y netcat

# Recon-ng
print_status "Installing Recon-ng..."
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
pip3 install -r requirements.txt
cd ..

print_status "All tools installed successfully!"
print_warning "Please restart your terminal to ensure all environment variables are properly set."
