# 🛠️ Offensive Security Toolkit Installer

A comprehensive one-click installer for **Red Team**, **CTF**, and **Pentesting tools** on Linux systems. This repository provides a unified solution to install and configure essential security tools with minimal effort.

![Linux](https://img.shields.io/badge/Linux-FCC624?style=for-the-badge&logo=linux&logoColor=black)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Shell Script](https://img.shields.io/badge/Shell_Script-121011?style=for-the-badge&logo=gnu-bash&logoColor=white)

## 🚀 Quick Start

### Prerequisites
- Linux-based system (Ubuntu 20.04/22.04 recommended)
- Internet connection
- sudo privileges
- At least 20GB of free disk space

### Installation Options

#### 1️⃣ Install All Tools (Recommended)
```bash
# Clone the repository
git clone https://github.com/yourusername/Offensive-Security-Toolkit-Installer.git
cd Offensive-Security-Toolkit-Installer

# Make the script executable and run it
chmod +x install-all-tools.sh
./install-all-tools.sh
```

#### 2️⃣ Install Red Team Tools Only
```bash
chmod +x install-redteam-tools.sh
./install-redteam-tools.sh
```

#### 3️⃣ Install CTF & Pentesting Tools Only
```bash
chmod +x install-ctf-tools.sh
./install-ctf-tools.sh
```

## 📦 Included Tools

### 🔴 Red Team Tools
- **Command & Control (C2)**
  - Empire
  - Covenant
  - Sliver
  - Mythic
  - Cobalt Strike

- **Lateral Movement & Post-Exploitation**
  - CrackMapExec
  - Mimikatz
  - BloodHound
  - Ligolo-ng
  - Chisel

- **Phishing & Social Engineering**
  - Evilginx2
  - Gophish
  - Nishang

- **Payload Generation & Obfuscation**
  - Donut
  - PEzor

### ⚙️ CTF & Pentesting Tools
- **Network Scanning & Enumeration**
  - Nmap
  - Gobuster
  - Dirsearch
  - Nikto

- **Web Application Security**
  - Burp Suite
  - SQLMap
  - Recon-ng

- **Reverse Engineering**
  - Ghidra
  - Radare2
  - pwndbg

- **Password Cracking & Analysis**
  - JohnTheRipper
  - Hashcat

- **Network Analysis**
  - Wireshark
  - Netcat
  - Hydra

## ✅ System Requirements
- **Operating System**: Ubuntu 20.04/22.04 (Desktop/Server)
- **Architecture**: x86_64
- **RAM**: Minimum 4GB (8GB recommended)
- **Storage**: Minimum 20GB free space
- **Network**: Stable internet connection

## 🛠️ Supported Environments
- Ubuntu Desktop/Server
- VirtualBox
- VMware
- KVM Virtual Machines
- Minimal GUI / headless setups

## 🔧 Troubleshooting
If you encounter any issues during installation:
1. Ensure you have sufficient disk space
2. Check your internet connection
3. Verify you have sudo privileges
4. Run the script with `bash -x` for detailed debugging:
   ```bash
   bash -x install-all-tools.sh
   ```

## ⚠️ Legal Disclaimer
This repository and its tools are intended for:
- Educational purposes
- Security research
- Authorized penetration testing
- CTF competitions

**IMPORTANT**: Only use these tools on systems you own or have explicit permission to test. Unauthorized use may violate local and international laws.

## 📝 License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🤝 Contributing
Contributions are welcome! Please feel free to submit a Pull Request.

## 📧 Contact
For questions or suggestions, please open an issue on GitHub.
