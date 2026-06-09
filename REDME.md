# Auto Recon Tool

**Automated Information Gathering Tool using Nmap**

A simple yet powerful interactive Bash script that performs automated reconnaissance on a target using multiple Nmap scans and generates organized reports.

## Features

- Fully interactive and user-friendly
- Automated multi-stage reconnaissance
- Service version detection
- OS detection
- Web service enumeration (when applicable)
- Clean folder structure for results
- Summary report generation
- Designed for Docker labs

---
## How to Use

### 1. Start the Docker Lab

```bash
docker-compose up -d
2. Enter Kali Container
Bashdocker exec -it kali-administraitor bash
3. Run the Tool
Bash./auto-recon.sh
Example Target: 172.21.0.11 or 172.21.0.12

Output Structure
textresults/
└── [TARGET-IP]/
    ├── 01_host_discovery.txt
    ├── 02_service_version.txt
    ├── 03_full_port_scan.txt
    ├── 04_os_scripts.txt
    ├── 05_web_enum.txt
    └── SUMMARY.txt
```
Technologies

Bash Scripting
Nmap
Docker & Docker Compose
Kali Linux


Security Note
This tool is for educational and authorized testing purposes only. Always get proper permission before scanning any network.
