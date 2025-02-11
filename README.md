# WiFi Sniffer: Passive Website Capture with ARP Spoofing
This script allows you to **passively capture visited websites** on a WiFi network by performing **ARP spoofing** and sniffing TLS SNI & DNS queries.  

⚠️ **Warning:** This script is for **educational and authorized security testing only**. Unauthorized use is **illegal**.

## 📌 Features
✅ **ARP spoofing**: Redirects the target’s traffic through your system  
✅ **Traffic sniffing**: Logs all visited websites (TLS SNI + DNS)  
✅ **Ensures target can browse normally** (fixes ARP disruptions)  
✅ **Restores network settings when stopped**  

## 📦 Requirements
- Linux system (Debian/Ubuntu/Kali recommended)
- `tshark` (Wireshark CLI)  
  ```sh
  sudo apt install tshark -y
