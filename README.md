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
- For arpspoof
  ```sh
  sudo apt install dsniff -y
-----------------------------------------------------------------------------------------------------------------------------------------------------------
1️⃣ Find Target & Router IP
Find the router's gateway IP:

```sh
ip route | grep default
Find connected devices on the network:

```sh
sudo arp-scan --localnet
Pick the target device's IP (e.g., 192.168.0.20).

2️⃣ Run the Script
Edit the script to match your network:

Set the correct WiFi interface (wlan0 or wlan1)
Set the target device's IP and router's IP
Then run the script:

```sh
sudo bash wifi_sniffer.sh
3️⃣ Stop & Restore Network
Press CTRL+C to stop the attack.
This will restore your network settings.

📂 Output
Captured websites are logged to sniffed_sites.log:

www.google.com
www.facebook.com
www.twitter.com
---------------------------------------------------------------------------------------------------------------------------------
🛑 Legal Disclaimer
This script is intended for security research & educational use only.
Do not use it on networks without permission. Unauthorized sniffing violates laws such as the Computer Fraud and Abuse Act (CFAA).

vbnet
Copy
Edit

---

## **📝 Next Steps**
Would you like me to:
✅ **Add filtering to log only specific domains?**  
✅ **Store timestamps for each captured site?**  
✅ **Convert this into a Python version with real-time visualization?**  

Let me know how you'd like to improve this! 🚀
