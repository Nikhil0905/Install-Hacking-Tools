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

# --- Network Scanning & Enumeration ---
print_status "Installing Network Scanning & Enumeration tools..."

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

# --- Web Application Security ---
print_status "Installing Web Application Security tools..."

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

# Recon-ng
print_status "Installing Recon-ng..."
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
pip3 install -r requirements.txt
cd ..

# --- Reverse Engineering ---
print_status "Installing Reverse Engineering tools..."

# Ghidra
print_status "Installing Ghidra..."
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.2.4_build/ghidra_10.2.4_PUBLIC_20230202.zip
unzip ghidra_10.2.4_PUBLIC_20230202.zip
rm ghidra_10.2.4_PUBLIC_20230202.zip

# Radare2
print_status "Installing Radare2..."
sudo apt install -y radare2

# pwndbg
print_status "Installing pwndbg..."
git clone https://github.com/pwndbg/pwndbg.git
cd pwndbg
./setup.sh
cd ..

# --- Password Cracking & Analysis ---
print_status "Installing Password Cracking & Analysis tools..."

# JohnTheRipper
print_status "Installing JohnTheRipper..."
sudo apt install -y john

# Hashcat
print_status "Installing Hashcat..."
sudo apt install -y hashcat

# --- Network Analysis ---
print_status "Installing Network Analysis tools..."

# Wireshark
print_status "Installing Wireshark..."
sudo apt install -y wireshark

# Netcat
print_status "Installing Netcat..."
sudo apt install -y netcat

# Hydra
print_status "Installing Hydra..."
sudo apt install -y hydra

# --- Additional Tools ---
print_status "Installing Additional Tools..."

# Metasploit
print_status "Installing Metasploit..."
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall
chmod 755 msfinstall
./msfinstall

# SecLists
print_status "Installing SecLists..."
sudo apt install -y seclists
ln -s /usr/share/seclists ~/SecLists

# PEASS-ng
print_status "Installing PEASS-ng..."
git clone https://github.com/carlospolop/PEASS-ng.git

print_status "All CTF & Pentesting tools installed successfully!"
print_warning "Please restart your terminal to ensure all environment variables are properly set."
