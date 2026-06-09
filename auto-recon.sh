#!/bin/bash

clear
echo "============================================"
echo "   Auto Recon Tool - Automated Reconnaissance"
echo "============================================"

read -p "🎯 Enter target IP or Domain (e.g. 172.20.0.11): " target

if [ -z "$target" ]; then
    echo "❌ Error: Target cannot be empty!"
    exit 1
fi

echo -e "\n🚀 Starting Automated Recon on: $target"
echo "Results will be saved in: ./results/$target/"
mkdir -p results/$target
cd results/$target

echo "[1/6] Host Discovery..."
nmap -sn $target -oN 01_host_discovery.txt

echo "[2/6] Service & Version Detection..."
nmap -sV -T4 $target -oN 02_service_version.txt

echo "[3/6] Full Port Scan..."
nmap -sV -p- --open -T3 $target -oN 03_full_port_scan.txt

echo "[4/6] OS Detection + Default Scripts..."
nmap -sV -O -sC $target -oN 04_os_scripts.txt

echo "[5/6] Web Enumeration (if applicable)..."
if grep -E "80/open|443/open|http" 02_service_version.txt > /dev/null; then
    echo "🌐 Web services detected, running web scripts..."
    nmap -sV --script http-title,http-enum,http-headers,http-methods $target -p 80,443 -oN 05_web_enum.txt
fi

echo "[6/6] Generating Summary Report..."
{
    echo "=== AUTO RECON REPORT ==="
    echo "Target     : $target"
    echo "Date       : $(date)"
    echo "----------------------------------------"
    echo "Open Ports Summary:"
    grep "open" 02_service_version.txt | head -20
    echo "----------------------------------------"
    echo "Scan completed successfully!"
} > SUMMARY.txt

echo ""
echo "✅ Auto Recon Completed Successfully!"
echo "📁 Results saved in: $(pwd)"
echo ""
