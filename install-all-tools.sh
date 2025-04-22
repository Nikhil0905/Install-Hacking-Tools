#!/bin/bash

# Update and upgrade the system first
echo "[+] Updating and upgrading system..."
sudo apt update && sudo apt upgrade -y

# Install basic dependencies
echo "[+] Installing basic dependencies..."
sudo apt install -y git curl wget unzip build-essential golang python3-pip

# ---- Red Team Tools ----

echo "[+] Installing Red Team Tools..."

# Empire
git clone https://github.com/EmpireProject/Empire.git

# Covenant
git clone https://github.com/cobbr/Covenant.git

# Sliver
git clone https://github.com/BishopFox/sliver.git

# Mythic
git clone https://github.com/its_a_feature/Mythic.git

# CrackMapExec
git clone https://github.com/byt3bl33d3r/CrackMapExec.git

# Mimikatz
git clone https://github.com/gentilkiwi/mimikatz.git

# BloodHound
git clone https://github.com/BloodHoundAD/BloodHound.git

# Evilginx2
git clone https://github.com/evilginx2/evilginx2.git

# Gophish
git clone https://github.com/gophish/gophish.git

# Nishang
git clone https://github.com/samratashok/nishang.git

# Ligolo-ng
git clone https://github.com/andrew-d/staticfire.git

# Chisel
git clone https://github.com/jpillora/chisel.git

# Donut
git clone https://github.com/thedarkwinter/donut.git

# PEzor
git clone https://github.com/pezet/PEzor.git

# Cobalt Strike
git clone https://github.com/impactas/CobaltStrike.git

# ---- CTF/Pentesting Tools ----

echo "[+] Installing CTF/Pentesting Tools..."

# Nmap
sudo apt install -y nmap

# Gobuster
go install github.com/OJ/gobuster/v3@latest

# Dirsearch
git clone https://github.com/maurosoria/dirsearch.git

# Nikto
sudo apt install -y nikto

# Burp Suite
wget https://portswigger.net/burp/releases/download?product=community&version=2023.4.1&type=Linux
chmod +x burpsuite_community_linux_v2023_4_1.sh
./burpsuite_community_linux_v2023_4_1.sh

# SQLMap
git clone https://github.com/sqlmapproject/sqlmap.git

# JohnTheRipper
sudo apt install -y john

# Metasploit
curl https://raw.githubusercontent.com/rapid7/metasploit-framework/master/msfvenom | bash

# Ghidra
wget https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.2.4_build/ghidra_10.2.4_PUBLIC_20230202.zip
unzip ghidra_10.2.4_PUBLIC_20230202.zip
./ghidra_10.2.4_PUBLIC/ghidraRun

# Radare2
sudo apt install -y radare2

# Wireshark
sudo apt install -y wireshark

# Hydra
sudo apt install -y hydra

# Hashcat
sudo apt install -y hashcat

# pwndbg
git clone https://github.com/pwndbg/pwndbg.git
cd pwndbg
./setup.sh

# Netcat
sudo apt install -y netcat

# Recon-ng
git clone https://github.com/lanmaster53/recon-ng.git
cd recon-ng
./recon-ng

echo "[+] All tools installed successfully!"
