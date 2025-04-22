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

# Install common dependencies
print_status "Installing common dependencies..."
sudo apt install -y \
    git curl python3-pip unzip build-essential \
    wget gnupg net-tools \
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

# --- Command & Control (C2) ---
print_status "Installing Command & Control tools..."

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

# --- Lateral Movement & Post-Exploitation ---
print_status "Installing Lateral Movement & Post-Exploitation tools..."

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

# Impacket
print_status "Installing Impacket..."
git clone https://github.com/fortra/impacket.git
cd impacket
pip3 install .
cd ..

# --- Phishing & Social Engineering ---
print_status "Installing Phishing & Social Engineering tools..."

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

# --- Tunneling & Covert Channels ---
print_status "Installing Tunneling & Covert Channel tools..."

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
chmod +x chisel_$(uname -f)_amd64
mv chisel_$(uname -f)_amd64 chisel

# --- Payload Generation & Obfuscation ---
print_status "Installing Payload Generation & Obfuscation tools..."

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

print_status "All Red Team tools installed successfully!"
print_warning "Please restart your terminal to ensure all environment variables are properly set."
