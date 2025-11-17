@echo off
netsh -c wlan
netsh winsock reset
netsh int ip reset
netsh wlan show profiles
netsh wlan show profiles name="Local UniFi Express"
netsh advfirewall show allprofiles
netsh advfirewall firewall show rule name=all profile=domain
netsh advfirewall set allprofiles state off
netsh advfirewall set domainprofile state off
netsh advfirewall export "C:\temp\Firewall-Config-Export.wfw"
netsh advfirewall reset
netsh advfirewall firewall add rule name="Web Server" dir=in action=allow protocol=TCP localport=80,443
netsh advfirewall firewall add rule name="My Program" dir=in action=allow program="C:\Path\To\Program.exe" profile=any
netsh advfirewall firewall add rule name="Allow ICMP" dir=in action=allow protocol=icmpv4
netsh interface show interface
netsh interface ipv4 show config "Wi-Fi"
netsh interface ipv4 show route
# Set a static IP Address
netsh interface ip set address name="Ethernet" static 192.168.1.10 255.255.255.0 192.168.1.1
# Set the DNS server
netsh interface ip set dns name="Ethernet" static 8.8.8.8
# Set the IP Address to DHCP
netsh interface ipv4 set address name="Ethernet" source=dhcp
# Set DNS to DHCP
netsh interface ipv4 set dns name="Ethernet" source=dhcp
netsh interface ipv6 set interface "Ethernet" disabled=yes
netsh winhttp show proxy
netsh winhttp set proxy proxy-server="proxy.company.com:8080" bypass-list="*.local;<local>"
netsh winhttp reset proxy
netsh trace show scenarios
netsh trace start scenario=NetConnection capture=yes tracefile=c:\temp\trace.etl
netsh trace stop
netsh wlan show wlanreport duration="7"