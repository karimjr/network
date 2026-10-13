# 2026-10-13 11:22:02 by RouterOS 7.24.5
# software id = XRZ3-YAKC
#
# model = RB5009UPr+S+
# serial number = HG909VSY20Z
/interface bridge
add name="bridge1-ALL INET" port-cost-mode=short
/interface ethernet
set [ find default-name=ether1 ] l2mtu=1514 name=ether1-Starlink
set [ find default-name=ether2 ] l2mtu=1514
set [ find default-name=ether3 ] l2mtu=1514
set [ find default-name=ether4 ] l2mtu=1514
set [ find default-name=ether5 ] l2mtu=1514
set [ find default-name=ether6 ] l2mtu=1514
set [ find default-name=ether7 ] l2mtu=1514
set [ find default-name=ether8 ] l2mtu=1514
set [ find default-name=sfp-sfpplus1 ] l2mtu=1514
/interface wireless security-profiles
set [ find default=yes ] supplicant-identity=MikroTik
/ip dhcp-server
add add-arp=yes interface="bridge1-ALL INET" name="DHCP - Utama"
/ip pool
add name=dhcp_pool1 ranges=10.20.0.2-10.20.1.254
/queue type
add kind=fq-codel name=My-FQ-CoDel
/queue simple
add comment="No Limit" name="No Limit" priority=1/1 queue=\
    My-FQ-CoDel/My-FQ-CoDel target=10.20.0.66/32,10.20.0.62/32,10.20.0.40/32
add max-limit=20M/20M name=SPV priority=1/1 queue=My-FQ-CoDel/My-FQ-CoDel \
    target="10.20.0.104/32,10.20.0.86/32,10.20.0.214/32,10.20.0.65/32,10.20.0.\
    175/32,10.20.0.170/32,10.20.0.5/32,10.20.0.74/32,10.20.0.160/32"
add comment=CCTV max-limit=15M/15M name=CCTV queue=My-FQ-CoDel/My-FQ-CoDel \
    target="10.20.0.217/32,10.20.0.191/32,10.20.0.196/32,10.20.0.189/32,10.20.\
    1.94/32,10.20.0.206/32,10.20.0.238/32,10.20.0.235/32,10.20.0.216/32,10.20.\
    0.209/32,10.20.0.232/32,10.20.0.221/32,10.20.0.228/32,10.20.0.247/32,10.20\
    .0.248/32,10.20.0.223/32,10.20.0.204/32,10.20.0.222/32,10.20.0.240/32,10.2\
    0.0.194/32,10.20.0.215/32,10.20.0.174/32,10.20.0.252/32,10.20.0.197/32,10.\
    20.0.229/32,10.20.0.220/32,10.20.0.199/32,10.20.0.242/32,10.20.0.176/32,10\
    .20.0.182/32,10.20.0.173/32,10.20.0.227/32,10.20.0.183/32,10.20.0.180/32,1\
    0.20.0.185/32,10.20.0.219/32,10.20.0.195/32,10.20.0.179/32,10.20.0.188/32,\
    10.20.0.178/32,10.20.0.200/32,10.20.0.187/32,10.20.0.193/32,10.20.0.190/32\
    ,10.20.0.205/32,10.20.0.181/32,10.20.0.184/32,10.20.0.192/32,10.20.0.198/3\
    2,10.20.0.201/32,10.20.0.218/32,10.20.0.202/32,10.20.0.233/32,10.20.0.210/\
    32,10.20.0.254/32,10.20.0.211/32,10.20.0.225/32,10.20.0.207/32,10.20.0.203\
    /32,10.20.0.246/32"
add comment=Opis max-limit=15M/15M name=Office queue=My-FQ-CoDel/My-FQ-CoDel \
    target="10.20.0.7/32,10.20.0.145/32,10.20.0.2/32,10.20.0.12/32,10.20.0.172\
    /32,10.20.0.134/32,10.20.0.84/32,10.20.0.124/32,10.20.0.159/32"
add comment=Belakang max-limit=20M/20M name="Kaum Belakang Mess" priority=1/1 \
    queue=My-FQ-CoDel/My-FQ-CoDel target="10.20.1.44/32,10.20.1.180/32,10.20.1\
    .45/32,10.20.0.142/32,10.20.0.39/32,10.20.0.43/32,10.20.1.83/32,10.20.1.17\
    9/32,10.20.1.181/32,10.20.0.122/32,10.20.1.18/32,10.20.1.20/32"
add comment="Default Limit" max-limit=5M/10M name=Default-Limit-All queue=\
    pcq-upload-default/pcq-download-default target=10.10.0.0/23,10.20.0.0/24
/zerotier
set zt1 disabled=no disabled=no
/zerotier interface
add allow-default=yes allow-global=yes allow-managed=yes disabled=no \
    instance=zt1 name=zerotier1 network=9f77fc393e344757
/interface bridge port
add bridge="bridge1-ALL INET" interface=ether3 internal-path-cost=10 \
    path-cost=10
add bridge="bridge1-ALL INET" interface=ether4 internal-path-cost=10 \
    path-cost=10
add bridge="bridge1-ALL INET" interface=ether2 internal-path-cost=10 \
    path-cost=10
add bridge="bridge1-ALL INET" interface=ether6 internal-path-cost=10 \
    path-cost=10
add bridge="bridge1-ALL INET" interface=ether7 internal-path-cost=10 \
    path-cost=10
add bridge="bridge1-ALL INET" interface=ether8 internal-path-cost=10 \
    path-cost=10
add bridge="bridge1-ALL INET" interface=ether5 internal-path-cost=10 \
    path-cost=10
/ip firewall connection tracking
set udp-timeout=10s
/interface detect-internet
set detect-interface-list=all
/interface ovpn-server server
add mac-address=FE:3C:19:68:71:CB name=ovpn-server1
/ip address
add address=10.20.0.1/23 comment="ALL INET" interface="bridge1-ALL INET" \
    network=10.20.0.0
/ip dhcp-client
add interface=ether1-Starlink name=ether1-Starlink
/ip dhcp-server lease
add address=10.20.0.254 client-id=1:50:e5:38:c3:7d:da comment=\
    "CCTV Depan Mesjid" mac-address=50:E5:38:C3:7D:DA server="DHCP - Utama"
add address=10.20.0.248 client-id=1:8:cc:81:5d:d8:c7 comment=\
    "CCTV Pencucian Troli" mac-address=08:CC:81:5D:D8:C7 server=\
    "DHCP - Utama"
add address=10.20.0.247 client-id=1:8:cc:81:5d:d9:c3 comment="CCTV Creeper 8" \
    mac-address=08:CC:81:5D:D9:C3 server="DHCP - Utama"
add address=10.20.0.246 client-id=1:8:cc:81:5d:d8:b3 comment=\
    "CCTV Area Solar Produksi" mac-address=08:CC:81:5D:D8:B3 server=\
    "DHCP - Utama"
add address=10.20.0.242 client-id=1:8:cc:81:5d:d8:e1 comment="CCTV FG 2" \
    mac-address=08:CC:81:5D:D8:E1 server="DHCP - Utama"
add address=10.20.0.251 comment=RouterAP_PBS-Dryer mac-address=\
    9C:CE:88:47:A3:B1 server="DHCP - Utama"
add address=10.20.0.253 comment=RouterAP_PBS-Workshop mac-address=\
    C4:B2:5B:9B:BE:0E server="DHCP - Utama"
add address=10.20.0.238 client-id=1:8:cc:81:5d:d8:a4 comment=\
    "CCTV Area Parkir" mac-address=08:CC:81:5D:D8:A4 server="DHCP - Utama"
add address=10.20.0.235 client-id=1:8:cc:81:5d:d8:a6 comment="CCTV Area RM 1" \
    mac-address=08:CC:81:5D:D8:A6 server="DHCP - Utama"
add address=10.20.0.233 client-id=1:8:cc:81:5d:d8:a9 comment=\
    "CCTV Belakang Mess" mac-address=08:CC:81:5D:D8:A9 server="DHCP - Utama"
add address=10.20.0.232 client-id=1:8:cc:81:5d:d8:b2 comment=\
    "CCTV Slab Cutter" mac-address=08:CC:81:5D:D8:B2 server="DHCP - Utama"
add address=10.20.0.229 client-id=1:50:e5:38:e3:2e:dd comment=\
    "CCTV PTZ Dryer - QC" mac-address=50:E5:38:E3:2E:DD server="DHCP - Utama"
add address=10.20.0.228 client-id=1:8:cc:81:5d:d8:c5 comment=\
    "CCTV Area Creeper 5-8" mac-address=08:CC:81:5D:D8:C5 server=\
    "DHCP - Utama"
add address=10.20.0.227 client-id=1:8:cc:81:5d:d9:3f comment=\
    "CCTV Depan Genset" mac-address=08:CC:81:5D:D9:3F server="DHCP - Utama"
add address=10.20.0.225 client-id=1:8:cc:81:5d:d9:40 comment=\
    "CCTV Pump House Blower" mac-address=08:CC:81:5D:D9:40 server=\
    "DHCP - Utama"
add address=10.20.0.223 client-id=1:50:e5:38:f4:39:cf comment=\
    "CCTV PTZ Ampaian Bawah" mac-address=50:E5:38:F4:39:CF server=\
    "DHCP - Utama"
add address=10.20.0.222 client-id=1:50:e5:38:e3:2e:e7 comment=\
    "CCTV PTZ Ampaian Lt.3" mac-address=50:E5:38:E3:2E:E7 server=\
    "DHCP - Utama"
add address=10.20.0.221 client-id=1:8:cc:81:5d:d8:9f comment=\
    "CCTV Washing Tank" mac-address=08:CC:81:5D:D8:9F server="DHCP - Utama"
add address=10.20.0.220 client-id=1:8:cc:81:5d:d8:bb comment=\
    "CCTV Dryer - Belakang" mac-address=08:CC:81:5D:D8:BB server=\
    "DHCP - Utama"
add address=10.20.0.219 client-id=1:8:cc:81:5d:d8:dd comment=\
    "CCTV Kerja Workshop" mac-address=08:CC:81:5D:D8:DD server="DHCP - Utama"
add address=10.20.0.244 comment=RouterAP_PBS-Wet mac-address=\
    9C:CE:88:47:E2:A9 server="DHCP - Utama"
add address=10.20.0.218 client-id=1:8:cc:81:5d:d9:48 comment="CCTV Area B3" \
    mac-address=08:CC:81:5D:D9:48 server="DHCP - Utama"
add address=10.20.0.217 client-id=1:88:de:39:d8:47:85 comment="CCTV A. NVR" \
    mac-address=88:DE:39:D8:47:85 server="DHCP - Utama"
add address=10.20.0.215 client-id=1:8:cc:81:5d:d8:ba comment=\
    "CCTV Kolam Ampaian 1" mac-address=08:CC:81:5D:D8:BA server=\
    "DHCP - Utama"
add address=10.20.0.212 client-id=1:8:cc:81:5d:d8:d5 comment=\
    "CCTV Jalur Masuk Belakang Mess" mac-address=08:CC:81:5D:D8:D5 server=\
    "DHCP - Utama"
add address=10.20.0.211 client-id=1:8:cc:81:5d:d8:af comment=\
    "CCTV Jalur Masuk Mess Depan" mac-address=08:CC:81:5D:D8:AF server=\
    "DHCP - Utama"
add address=10.20.0.210 client-id=1:8:cc:81:5d:d8:b7 comment=\
    "CCTV Belakang Mess BOD" mac-address=08:CC:81:5D:D8:B7 server=\
    "DHCP - Utama"
add address=10.20.0.209 client-id=1:8:cc:81:5d:d8:ce comment=\
    "CCTV Area Kerja Horas" mac-address=08:CC:81:5D:D8:CE server=\
    "DHCP - Utama"
add address=10.20.0.208 client-id=1:8:cc:81:5d:d8:c0 comment=\
    "CCTV Mess Blok C & E" mac-address=08:CC:81:5D:D8:C0 server=\
    "DHCP - Utama"
add address=10.20.0.207 client-id=1:5c:34:5b:64:a2:70 comment="CCTV R. Medic" \
    mac-address=5C:34:5B:64:A2:70 server="DHCP - Utama"
add address=10.20.0.206 client-id=1:8:cc:81:5d:d8:bc comment=\
    "CCTV Samping Pabrik" mac-address=08:CC:81:5D:D8:BC server="DHCP - Utama"
add address=10.20.0.205 client-id=1:24:48:45:59:4a:aa comment=\
    "CCTV R. Server" mac-address=24:48:45:59:4A:AA server="DHCP - Utama"
add address=10.20.0.204 client-id=1:50:e5:38:e3:2e:fd comment=\
    "CCTV PTZ Ampaian Lt.2" mac-address=50:E5:38:E3:2E:FD server=\
    "DHCP - Utama"
add address=10.20.0.203 client-id=1:24:48:45:59:4a:81 comment=\
    "CCTV R. Pembelian" mac-address=24:48:45:59:4A:81 server="DHCP - Utama"
add address=10.20.0.202 client-id=1:5c:34:5b:64:a3:48 comment=\
    "CCTV Area Smoking" mac-address=5C:34:5B:64:A3:48 server="DHCP - Utama"
add address=10.20.0.201 client-id=1:8:cc:81:5d:d8:a2 comment=\
    "CCTV Solar Produksi" mac-address=08:CC:81:5D:D8:A2 server="DHCP - Utama"
add address=10.20.0.200 client-id=1:5c:34:5b:64:a3:44 comment=\
    "CCTV R. Analisa Lab 2" mac-address=5C:34:5B:64:A3:44 server=\
    "DHCP - Utama"
add address=10.20.0.199 client-id=1:8:cc:81:5d:d8:a7 comment="CCTV FG 1" \
    mac-address=08:CC:81:5D:D8:A7 server="DHCP - Utama"
add address=10.20.0.198 client-id=1:8:cc:81:5d:d8:d4 comment=\
    "CCTV Area Mushola" mac-address=08:CC:81:5D:D8:D4 server="DHCP - Utama"
add address=10.20.0.197 client-id=1:8:cc:81:5d:d8:be comment=\
    "CCTV Dryer - Depan 2" mac-address=08:CC:81:5D:D8:BE server=\
    "DHCP - Utama"
add address=10.20.0.196 client-id=1:8:cc:81:5d:d8:c2 comment=\
    "CCTV Pos Security" mac-address=08:CC:81:5D:D8:C2 server="DHCP - Utama"
add address=10.20.0.195 client-id=1:50:e5:38:c3:7e:92 comment=\
    "CCTV PTZ Ampaian Belakang" mac-address=50:E5:38:C3:7E:92 server=\
    "DHCP - Utama"
add address=10.20.0.194 client-id=1:8:cc:81:5d:d9:56 comment=\
    "CCTV Samping Ampaian" mac-address=08:CC:81:5D:D9:56 server=\
    "DHCP - Utama"
add address=10.20.0.193 client-id=1:5c:34:5b:64:a2:75 comment=\
    "CCTV R. Timbang Lab" mac-address=5C:34:5B:64:A2:75 server="DHCP - Utama"
add address=10.20.0.192 client-id=1:8:cc:81:5d:d9:42 comment=\
    "CCTV Area Panel" mac-address=08:CC:81:5D:D9:42 server="DHCP - Utama"
add address=10.20.0.191 client-id=1:8:cc:81:5d:d8:c4 comment=\
    "CCTV Depan Gerbang" mac-address=08:CC:81:5D:D8:C4 server="DHCP - Utama"
add address=10.20.0.190 client-id=1:24:48:45:59:4c:45 comment=\
    "CCTV R. Administrasi" mac-address=24:48:45:59:4C:45 server=\
    "DHCP - Utama"
add address=10.20.0.189 client-id=1:8:cc:81:5d:d8:b0 comment=\
    "CCTV Depan Timbangan 1" mac-address=08:CC:81:5D:D8:B0 server=\
    "DHCP - Utama"
add address=10.20.0.188 client-id=1:5c:34:5b:64:a3:3b comment="CCTV Lobby" \
    mac-address=5C:34:5B:64:A3:3B server="DHCP - Utama"
add address=10.20.0.187 client-id=1:24:48:45:59:4c:aa comment=\
    "CCTV R. Arsip Lab" mac-address=24:48:45:59:4C:AA server="DHCP - Utama"
add address=10.20.0.185 client-id=1:8:cc:81:5d:d8:b4 comment="CCTV Warehouse" \
    mac-address=08:CC:81:5D:D8:B4 server="DHCP - Utama"
add address=10.20.0.184 client-id=1:24:48:45:59:4c:3e comment="CCTV Dapur" \
    mac-address=24:48:45:59:4C:3E server="DHCP - Utama"
add address=10.20.0.183 client-id=1:8:cc:81:5d:d9:86 comment=\
    "CCTV Ruang Genset" mac-address=08:CC:81:5D:D9:86 server="DHCP - Utama"
add address=10.20.0.182 client-id=1:8:cc:81:5d:d9:41 comment=\
    "CCTV Samping Workshop" mac-address=08:CC:81:5D:D9:41 server=\
    "DHCP - Utama"
add address=10.20.0.181 client-id=1:8:cc:81:5d:d8:e2 comment=\
    "CCTV Pump House Rubber Trap" mac-address=08:CC:81:5D:D8:E2 server=\
    "DHCP - Utama"
add address=10.20.0.180 client-id=1:8:cc:81:5d:d9:78 comment=\
    "CCTV Area Belakang Pabrik" mac-address=08:CC:81:5D:D9:78 server=\
    "DHCP - Utama"
add address=10.20.0.179 client-id=1:24:48:45:59:4e:2d comment=\
    "CCTV Teras Kantor" mac-address=24:48:45:59:4E:2D server="DHCP - Utama"
add address=10.20.0.178 client-id=1:24:48:45:59:4c:33 comment=\
    "CCTV R. Analisa Lab 1" mac-address=24:48:45:59:4C:33 server=\
    "DHCP - Utama"
add address=10.20.0.176 client-id=1:8:cc:81:5d:d8:cf comment="CCTV FG 3" \
    mac-address=08:CC:81:5D:D8:CF server="DHCP - Utama"
add address=10.20.0.174 client-id=1:8:cc:81:5d:d8:d0 comment=\
    "CCTV Dryer - Depan 1" mac-address=08:CC:81:5D:D8:D0 server=\
    "DHCP - Utama"
add address=10.20.0.7 client-id=1:9c:6b:0:ae:cc:f4 mac-address=\
    9C:6B:00:AE:CC:F4 server="DHCP - Utama"
add address=10.20.0.46 comment=RouterAP_PBS-Office mac-address=\
    C4:B2:5B:99:FC:EA server="DHCP - Utama"
add address=10.20.0.66 client-id=1:d4:e9:8a:d5:ed:5a mac-address=\
    D4:E9:8A:D5:ED:5A server="DHCP - Utama"
add address=10.20.0.88 client-id=1:64:c6:d2:2e:5b:75 comment=HSE mac-address=\
    64:C6:D2:2E:5B:75 server="DHCP - Utama"
add address=10.20.0.104 client-id=1:c0:bf:be:9a:98:12 mac-address=\
    C0:BF:BE:9A:98:12 server="DHCP - Utama"
add address=10.20.0.106 client-id=1:a8:e2:91:f0:7:3a mac-address=\
    A8:E2:91:F0:07:3A server="DHCP - Utama"
add address=10.20.0.145 client-id=1:70:8:94:9f:e9:65 mac-address=\
    70:08:94:9F:E9:65 server="DHCP - Utama"
add address=10.20.0.29 comment=RouterAP_PBS-R.Direktur mac-address=\
    9C:CE:88:47:A5:05 server="DHCP - Utama"
add address=10.20.0.28 client-id=1:38:1a:52:fa:fe:dd comment=QC mac-address=\
    38:1A:52:FA:FE:DD server="DHCP - Utama"
add address=10.20.0.27 client-id=1:38:1a:52:fb:52:11 comment=RM mac-address=\
    38:1A:52:FB:52:11 server="DHCP - Utama"
add address=10.20.0.21 client-id=1:10:a5:62:67:26:ec comment=\
    "Absen Finger Depan" mac-address=10:A5:62:67:26:EC server="DHCP - Utama"
add address=10.20.0.156 client-id=1:70:8:94:9e:eb:19 mac-address=\
    70:08:94:9E:EB:19 server="DHCP - Utama"
add address=10.20.0.162 client-id=1:c8:90:8a:fb:64:4b mac-address=\
    C8:90:8A:FB:64:4B server="DHCP - Utama"
add address=10.20.0.168 client-id=1:3c:a:f3:d2:4c:3 mac-address=\
    3C:0A:F3:D2:4C:03 server="DHCP - Utama"
add address=10.20.0.175 client-id=1:6c:2f:80:c9:c5:b6 mac-address=\
    6C:2F:80:C9:C5:B6 server="DHCP - Utama"
add address=10.20.0.214 client-id=1:c0:bf:be:fc:78:c4 mac-address=\
    C0:BF:BE:FC:78:C4 server="DHCP - Utama"
add address=10.20.0.2 client-id=1:70:8:94:ba:94:67 mac-address=\
    70:08:94:BA:94:67 server="DHCP - Utama"
add address=10.20.0.3 client-id=1:70:8:94:9f:e9:cf mac-address=\
    70:08:94:9F:E9:CF server="DHCP - Utama"
add address=10.20.0.5 client-id=1:3c:a:f3:d2:4c:9f mac-address=\
    3C:0A:F3:D2:4C:9F server="DHCP - Utama"
add address=10.20.0.12 client-id=1:70:8:94:a0:dc:f5 mac-address=\
    70:08:94:A0:DC:F5 server="DHCP - Utama"
add address=10.20.0.19 client-id=1:b8:1e:a4:d6:e3:d mac-address=\
    B8:1E:A4:D6:E3:0D server="DHCP - Utama"
add address=10.20.0.41 client-id=1:b8:1e:a4:d5:e6:7d mac-address=\
    B8:1E:A4:D5:E6:7D server="DHCP - Utama"
add address=10.20.0.74 client-id=1:3c:a:f3:d2:c1:25 mac-address=\
    3C:0A:F3:D2:C1:25 server="DHCP - Utama"
add address=10.20.0.134 client-id=1:24:b2:b9:24:a4:d1 mac-address=\
    24:B2:B9:24:A4:D1 server="DHCP - Utama"
add address=10.20.0.172 client-id=1:24:b2:b9:24:a4:d7 mac-address=\
    24:B2:B9:24:A4:D7 server="DHCP - Utama"
add address=10.20.0.170 client-id=1:44:fa:66:ef:f3:f1 mac-address=\
    44:FA:66:EF:F3:F1 server="DHCP - Utama"
add address=10.20.0.65 client-id=1:a8:e2:91:ef:39:32 mac-address=\
    A8:E2:91:EF:39:32 server="DHCP - Utama"
add address=10.20.0.186 client-id=1:3c:a:f3:d2:c0:45 mac-address=\
    3C:0A:F3:D2:C0:45 server="DHCP - Utama"
add address=10.20.0.137 client-id=1:14:99:3e:4:0:ad comment=\
    "Xiaomi P Darmawan" mac-address=14:99:3E:04:00:AD server="DHCP - Utama"
add address=10.20.0.37 client-id=1:50:bb:b5:3a:d1:12 mac-address=\
    50:BB:B5:3A:D1:12 server="DHCP - Utama"
add address=10.20.0.160 client-id=1:10:e1:8e:3a:ac:4e mac-address=\
    10:E1:8E:3A:AC:4E server="DHCP - Utama"
add address=10.20.0.52 client-id=1:9c:da:36:13:15:17 comment="Hp haris" \
    mac-address=9C:DA:36:13:15:17 server="DHCP - Utama"
add address=10.20.0.119 client-id=1:c8:90:8a:ed:8c:eb mac-address=\
    C8:90:8A:ED:8C:EB server="DHCP - Utama"
add address=10.20.0.139 client-id=1:68:c4:4c:a1:5a:f3 comment="HP Safril" \
    mac-address=68:C4:4C:A1:5A:F3 server="DHCP - Utama"
add address=10.20.0.163 client-id=1:c8:90:8a:9:85:fb comment="HP Bagus" \
    mac-address=C8:90:8A:09:85:FB server="DHCP - Utama"
add address=10.20.0.226 client-id=1:f8:28:19:6a:ac:9f mac-address=\
    F8:28:19:6A:AC:9F server="DHCP - Utama"
add address=10.20.0.40 client-id=1:90:9:d0:89:c9:f comment="Storage Server" \
    mac-address=90:09:D0:89:C9:0F server="DHCP - Utama"
add address=10.20.0.53 client-id=1:f8:c4:fa:fc:3:7b comment="HP FAUZI" \
    mac-address=F8:C4:FA:FC:03:7B server="DHCP - Utama"
add address=10.20.0.124 client-id=1:14:5e:69:55:fe:57 comment="HP Marliza" \
    mac-address=14:5E:69:55:FE:57 server="DHCP - Utama"
add address=10.20.0.4 client-id=1:38:1a:52:f3:fd:8 comment="Printer Office" \
    mac-address=38:1A:52:F3:FD:08 server="DHCP - Utama"
add address=10.20.0.84 client-id=1:b8:1e:a4:a7:b0:dd mac-address=\
    B8:1E:A4:A7:B0:DD server="DHCP - Utama"
add address=10.20.0.159 client-id=1:44:fa:66:ef:cb:89 mac-address=\
    44:FA:66:EF:CB:89 server="DHCP - Utama"
add address=10.20.0.113 client-id=1:b8:1:1f:51:e1:f8 comment="HP Alun" \
    mac-address=B8:01:1F:51:E1:F8 server="DHCP - Utama"
add address=10.20.0.121 client-id=1:e6:8e:a3:23:22:27 comment=\
    "Xiaomi P Darmawan" mac-address=E6:8E:A3:23:22:27 server="DHCP - Utama"
add address=10.20.0.26 comment="AP Mess" mac-address=58:B4:BB:19:65:46 \
    server="DHCP - Utama"
add address=10.20.0.142 client-id=1:18:d0:c5:61:8a:37 comment="HP Hamdani" \
    mac-address=18:D0:C5:61:8A:37 server="DHCP - Utama"
add address=10.20.0.86 client-id=1:60:ff:9e:46:9d:8a mac-address=\
    60:FF:9E:46:9D:8A server="DHCP - Utama"
add address=10.20.1.7 client-id=1:5c:16:48:4:a9:29 comment="HP Fahlul" \
    mac-address=5C:16:48:04:A9:29 server="DHCP - Utama"
add address=10.20.1.44 client-id=1:ec:2f:90:d2:66:e3 comment="HP Suryadi" \
    mac-address=EC:2F:90:D2:66:E3 server="DHCP - Utama"
add address=10.20.1.45 client-id=1:d4:ba:fa:ac:1f:f1 comment="HP Muzakir" \
    mac-address=D4:BA:FA:AC:1F:F1 server="DHCP - Utama"
add address=10.20.0.213 comment=RouterAP_PBS-SVR mac-address=\
    C4:B2:5B:9B:8F:47 server="DHCP - Utama"
add address=10.20.0.99 comment=RouterAP_PBS-BLOK-B4 mac-address=\
    10:82:3D:54:DB:DF server="DHCP - Utama"
add address=10.20.0.239 client-id=1:b0:9c:63:d2:e6:6b comment="HP Ersan" \
    mac-address=B0:9C:63:D2:E6:6B server="DHCP - Utama"
add address=10.20.0.171 comment=RouterAP_PBS-FISHING mac-address=\
    C4:B2:5B:9B:4C:9E server="DHCP - Utama"
add address=10.20.1.83 client-id=1:96:4f:49:45:c7:42 comment="HP Mursyita" \
    mac-address=96:4F:49:45:C7:42 server="DHCP - Utama"
add address=10.20.0.39 comment="HP Udin WS" mac-address=9E:B5:14:21:3C:DA \
    server="DHCP - Utama"
add address=10.20.0.43 client-id=1:84:e9:c1:6a:4f:29 comment="HP Bustanuddin" \
    mac-address=84:E9:C1:6A:4F:29 server="DHCP - Utama"
add address=10.20.0.18 comment=RouterAP_PBS-BLOK-D mac-address=\
    C4:B2:5B:9B:83:C1 server="DHCP - Utama"
add address=10.20.1.94 client-id=1:50:e5:38:c3:7e:42 comment=\
    "CCTV PTZ Depan Kantor" mac-address=50:E5:38:C3:7E:42 server=\
    "DHCP - Utama"
add address=10.20.0.15 comment=RouterAP_PBS-Blok-C mac-address=\
    C4:B2:5B:9B:2D:4A server="DHCP - Utama"
add address=10.20.0.25 comment=RouterAP_PBS-Mess-Direktur mac-address=\
    C4:B2:5B:9B:88:67 server="DHCP - Utama"
add address=10.20.0.69 comment="AP R. Meeting" mac-address=C4:B2:5B:F8:CC:6E \
    server="DHCP - Utama"
add address=10.20.1.176 client-id=1:3c:a:f3:d2:43:8b mac-address=\
    3C:0A:F3:D2:43:8B server="DHCP - Utama"
add address=10.20.0.173 client-id=1:50:e5:38:c3:7d:f6 comment="CCTV IPAL" \
    mac-address=50:E5:38:C3:7D:F6 server="DHCP - Utama"
add address=10.20.1.178 comment="HP NENEK GA" mac-address=B4:9D:02:0D:E0:A9 \
    server="DHCP - Utama"
add address=10.20.1.179 client-id=1:8c:d9:d6:e7:e8:d2 comment="HP RUSMANTO" \
    mac-address=8C:D9:D6:E7:E8:D2 server="DHCP - Utama"
add address=10.20.1.180 client-id=1:4:e5:98:6:3:d4 comment="HP TRI HANDIANTO" \
    mac-address=04:E5:98:06:03:D4 server="DHCP - Utama"
add address=10.20.1.182 client-id=1:bc:b2:cc:50:c4:ce comment="HP PAK YASRO" \
    mac-address=BC:B2:CC:50:C4:CE server="DHCP - Utama"
add address=10.20.1.183 comment="HP PAK Edward" mac-address=E2:8F:5A:C1:E6:8C \
    server="DHCP - Utama"
add address=10.20.1.185 client-id=1:1c:36:bb:be:52:5f comment="HP Bu Hani" \
    mac-address=1C:36:BB:BE:52:5F server="DHCP - Utama"
add address=10.20.0.216 client-id=1:8:cc:81:5d:d8:d6 comment="CCTV RAW MAT 2" \
    mac-address=08:CC:81:5D:D8:D6 server="DHCP - Utama"
add address=10.20.0.107 client-id=1:44:46:87:85:12:71 comment="HP P Ed 2" \
    mac-address=44:46:87:85:12:71 server="DHCP - Utama"
add address=10.20.0.146 client-id=1:6e:37:66:e5:67:c6 mac-address=\
    6E:37:66:E5:67:C6 server="DHCP - Utama"
add address=10.20.0.128 client-id=1:68:bf:c4:a:f8:82 mac-address=\
    68:BF:C4:0A:F8:82 server="DHCP - Utama"
add address=10.20.0.118 client-id=1:6e:c9:3f:6:34:98 mac-address=\
    6E:C9:3F:06:34:98 server="DHCP - Utama"
add address=10.20.1.246 client-id=1:8c:93:8b:26:cc:63 comment=\
    "HP Mandor Nyakfat" mac-address=8C:93:8B:26:CC:63 server="DHCP - Utama"
add address=10.20.1.247 comment="HP Mandor Mukhlis" mac-address=\
    5C:16:48:32:19:2F server="DHCP - Utama"
add address=10.20.1.181 client-id=1:64:a2:0:f7:63:52 comment="HP Pak suhaimi" \
    mac-address=64:A2:00:F7:63:52 server="DHCP - Utama"
add address=10.20.1.38 comment=RouterAP_PBS-BLOK-A4 mac-address=\
    C0:A4:76:F9:7D:C9 server="DHCP - Utama"
add address=10.20.1.248 client-id=1:a8:2b:d5:5f:64:8f comment="HP Novi" \
    mac-address=A8:2B:D5:5F:64:8F server="DHCP - Utama"
add address=10.20.1.249 client-id=1:98:60:ca:3a:83:97 comment="HP Hanifah 2" \
    mac-address=98:60:CA:3A:83:97 server="DHCP - Utama"
add address=10.20.1.250 client-id=1:d8:45:67:a8:46:e7 comment="HP Nugroho" \
    mac-address=D8:45:67:A8:46:E7 server="DHCP - Utama"
add address=10.20.1.251 client-id=1:ec:30:b3:95:37:e7 comment="HP Nugroho 2" \
    mac-address=EC:30:B3:95:37:E7 server="DHCP - Utama"
add address=10.20.0.114 comment="HP Tari" mac-address=A0:9D:22:C2:E2:8A \
    server="DHCP - Utama"
add address=10.20.0.75 comment="HP Desrika" mac-address=30:82:16:35:A0:2E
add address=10.20.0.67 comment="HP Ratna Dewi" mac-address=FC:18:3C:C1:3C:68 \
    server="DHCP - Utama"
add address=10.20.0.51 comment="HP Mada" mac-address=C8:90:8A:2D:1A:55
add address=10.20.0.54 comment="Hp Bejir" mac-address=A4:C7:88:68:3C:79 \
    server="DHCP - Utama"
add address=10.20.0.55 comment="HP Manohara" mac-address=28:8E:EC:DB:97:84 \
    server="DHCP - Utama"
add address=10.20.0.56 comment="HP Pak Jal" mac-address=D4:EC:AB:4C:22:C7 \
    server="DHCP - Utama"
add address=10.20.0.47 comment="HP Fauziaturrahmi" mac-address=\
    20:64:CB:20:59:D7 server="DHCP - Utama"
add address=10.20.0.44 client-id=1:5c:70:17:a:e0:6f comment="HP Awi Lab 1" \
    mac-address=5C:70:17:0A:E0:6F server="DHCP - Utama"
add address=10.20.0.45 client-id=1:fc:5b:8c:b9:31:d4 comment="Tab Awi Lab 2" \
    mac-address=FC:5B:8C:B9:31:D4 server="DHCP - Utama"
add address=10.20.0.30 comment="HP Bu Lis" mac-address=C8:90:8A:0F:2B:7F \
    server="DHCP - Utama"
add address=10.20.0.31 comment="HP P Safril 2" mac-address=00:7D:60:4C:FD:DA \
    server="DHCP - Utama"
add address=10.20.1.75 comment="HP Mandor FGE" mac-address=D4:BA:FA:AA:08:DD \
    server="DHCP - Utama"
add address=10.20.0.144 client-id=1:7c:8b:c1:fa:e7:a9 comment=\
    "HP Rahmatillah" mac-address=7C:8B:C1:FA:E7:A9 server="DHCP - Utama"
add address=10.20.0.147 comment="HP Rahmatillah 2" mac-address=\
    20:F4:78:3D:7B:AA server="DHCP - Utama"
add address=10.20.0.148 comment="HP Bg Refriandi Satpam" mac-address=\
    BC:09:63:2E:22:9D server="DHCP - Utama"
add address=10.20.1.254 client-id=1:74:6d:fa:4e:2c:b4 comment=\
    "HP Mandor Alaidin" mac-address=74:6D:FA:4E:2C:B4 server="DHCP - Utama"
add address=10.20.1.253 client-id=1:8c:86:1e:dd:3:35 comment="Hp angga" \
    mac-address=8C:86:1E:DD:03:35 server="DHCP - Utama"
add address=10.20.1.252 client-id=1:98:b3:79:b2:5b:8c comment="HP QC Fitri" \
    mac-address=98:B3:79:B2:5B:8C server="DHCP - Utama"
add address=10.20.1.243 client-id=1:78:d8:40:fd:aa:77 mac-address=\
    78:D8:40:FD:AA:77 server="DHCP - Utama"
add address=10.20.1.234 client-id=1:fc:43:45:32:c9:db mac-address=\
    FC:43:45:32:C9:DB server="DHCP - Utama"
add address=10.20.1.245 comment="HP Putra Satpam" mac-address=\
    FC:2A:46:1A:D6:E3 server="DHCP - Utama"
add address=10.20.1.242 client-id=1:94:8b:93:8f:45:63 comment="HP Haris" \
    mac-address=94:8B:93:8F:45:63 server="DHCP - Utama"
add address=10.20.1.79 client-id=1:ee:41:18:a:ea:f0 comment="Xiaomi Repeater" \
    mac-address=EE:41:18:0A:EA:F0 server="DHCP - Utama"
add address=10.20.1.235 client-id=1:e0:95:ff:22:54:78 comment="HP Mahdi" \
    mac-address=E0:95:FF:22:54:78 server="DHCP - Utama"
add address=10.20.1.73 client-id=1:e8:39:df:4b:f8:aa mac-address=\
    E8:39:DF:4B:F8:AA server="DHCP - Utama"
add address=10.20.0.62 client-id=1:20:34:62:14:4a:15 mac-address=\
    20:34:62:14:4A:15 server="DHCP - Utama"
add address=10.20.1.49 client-id=1:ce:b9:b3:d:a8:99 comment="Hp P Sabar 2" \
    mac-address=CE:B9:B3:0D:A8:99 server="DHCP - Utama"
add address=10.20.1.184 client-id=1:7c:2a:db:9f:c1:66 comment="Hp P Sabar 1" \
    mac-address=7C:2A:DB:9F:C1:66 server="DHCP - Utama"
add address=10.20.0.149 client-id=1:8a:66:e1:42:f6:2d comment="Hp P Doni 2" \
    mac-address=8A:66:E1:42:F6:2D server="DHCP - Utama"
add address=10.20.0.157 client-id=1:8:10:93:23:62:9d comment="Hp P Doni 1" \
    mac-address=08:10:93:23:62:9D server="DHCP - Utama"
add address=10.20.1.47 client-id=1:f8:87:f1:9e:11:de mac-address=\
    F8:87:F1:9E:11:DE server="DHCP - Utama"
add address=10.20.1.241 client-id=1:f4:d6:20:bf:8d:f6 comment="HP Wina" \
    mac-address=F4:D6:20:BF:8D:F6 server="DHCP - Utama"
add address=10.20.1.240 comment="HP Tari2" mac-address=F8:87:F1:9E:11:DE \
    server="DHCP - Utama"
add address=10.20.1.239 comment="HP Yatim" mac-address=54:1F:8D:94:02:0B \
    server="DHCP - Utama"
add address=10.20.1.238 client-id=1:0:ca:e0:ab:7a:61 comment="HP Dedi" \
    mac-address=00:CA:E0:AB:7A:61 server="DHCP - Utama"
add address=10.20.1.237 comment="HP Mandor Jarmadi" mac-address=\
    00:CA:E0:AD:59:93 server="DHCP - Utama"
add address=10.20.1.244 client-id=1:94:97:ae:f9:ea:53 comment=\
    "HP Samsuar Satpam" mac-address=94:97:AE:F9:EA:53 server="DHCP - Utama"
add address=10.20.0.236 comment="HP Junarsih" mac-address=D4:DC:40:55:50:1E \
    server="DHCP - Utama"
add address=10.20.1.233 comment="HP bg Zul Azhar GA" mac-address=\
    A4:C7:88:63:B3:45 server="DHCP - Utama"
add address=10.20.1.236 client-id=1:bc:b2:cc:f8:63:3e comment=\
    "HP P bustami GA" mac-address=BC:B2:CC:F8:63:3E server="DHCP - Utama"
add address=10.20.0.70 comment="HP P Surya GA" mac-address=AC:23:34:63:06:BF \
    server="DHCP - Utama"
add address=10.20.1.84 comment="HP Zul Rahmadiansyah" mac-address=\
    14:5E:69:76:06:43 server="DHCP - Utama"
add address=10.20.1.232 comment="HP Pak Muntasir Wanda Satpam" mac-address=\
    BC:2D:EF:4D:A3:F9 server="DHCP - Utama"
add address=10.20.1.231 comment="HP P T Saiful Satpam" mac-address=\
    68:F6:2B:7E:3A:A5 server="DHCP - Utama"
add address=10.20.1.230 comment="HP Angga 2" mac-address=F0:C3:71:A7:71:B8 \
    server="DHCP - Utama"
add address=10.20.1.229 comment="HP Rahul" mac-address=64:31:35:CE:D4:43 \
    server="DHCP - Utama"
add address=10.20.1.227 comment="HP P Wahyudi" mac-address=10:64:D9:86:C4:31 \
    server="DHCP - Utama"
add address=10.20.1.226 comment="HP Rusmanto 2" mac-address=54:1F:8D:4A:74:DE \
    server="DHCP - Utama"
add address=10.20.1.225 comment="HP  Mas Tri 2" mac-address=88:B9:51:77:0D:11 \
    server="DHCP - Utama"
add address=10.20.0.109 client-id=1:70:8:94:9e:eb:1b comment=\
    PBS-Warehouse-Admin mac-address=70:08:94:9E:EB:1B server="DHCP - Utama"
add address=10.20.0.165 client-id=1:34:5a:60:c0:ca:3a mac-address=\
    34:5A:60:C0:CA:3A server="DHCP - Utama"
add address=10.20.0.143 client-id=1:cc:73:14:96:a7:80 comment="HP Roman" \
    mac-address=CC:73:14:96:A7:80 server="DHCP - Utama"
add address=10.20.0.240 client-id=1:50:e5:38:c3:7e:3c comment=\
    "PTZ Samping Ampaian" mac-address=50:E5:38:C3:7E:3C server="DHCP - Utama"
add address=10.20.0.33 client-id=1:5c:93:a2:f0:8f:e8 comment="Laptop Iksan" \
    mac-address=5C:93:A2:F0:8F:E8 server="DHCP - Utama"
add address=10.20.0.16 comment="HP Iksan" mac-address=B4:31:61:0D:81:F3
add address=10.20.0.224 comment="HP P Nizam" mac-address=C0:ED:E5:3B:50:57
add address=10.20.0.177 comment="HP P Chief security" mac-address=\
    0C:A8:A7:C7:D1:F4
add address=10.20.0.122 client-id=1:c6:25:5c:d2:aa:93 comment="Hp Ijal" \
    mac-address=C6:25:5C:D2:AA:93 server="DHCP - Utama"
add address=10.20.1.85 comment="HP P udin 2" mac-address=02:00:00:00:00:00
add address=10.20.1.120 client-id=1:58:d6:97:4b:aa:2f comment="P UDIN HP" \
    mac-address=58:D6:97:4B:AA:2F server="DHCP - Utama"
add address=10.20.1.186 comment="HP FAUZI 2" mac-address=40:B6:07:BC:26:C1
add address=10.20.1.147 client-id=1:b8:1e:a4:36:d2:75 mac-address=\
    B8:1E:A4:36:D2:75 server="DHCP - Utama"
add address=10.20.1.18 client-id=1:0:7d:60:47:18:f1 mac-address=\
    00:7D:60:47:18:F1 server="DHCP - Utama"
add address=10.20.1.20 client-id=1:e8:5f:b4:3a:ed:bb comment="HP Bg syarwani" \
    mac-address=E8:5F:B4:3A:ED:BB server="DHCP - Utama"
add address=10.20.0.250 client-id=1:3c:a:f3:d2:ad:f7 mac-address=\
    3C:0A:F3:D2:AD:F7 server="DHCP - Utama"
add address=10.20.0.252 client-id=1:8:cc:81:5d:d8:b6 comment=\
    "CCTV Area Raw Mat Timbangan" mac-address=08:CC:81:5D:D8:B6 server=\
    "DHCP - Utama"
/ip dhcp-server network
add address=10.20.0.0/23 dns-server=10.20.0.1,1.1.1.1,1.0.0.1,8.8.8.8,8.8.4.4 \
    gateway=10.20.0.1
/ip dns
set allow-remote-requests=yes servers=1.1.1.1,1.0.0.1,8.8.8.8,8.8.4.4
/ip firewall nat
add action=masquerade chain=srcnat out-interface=ether1-Starlink
/ip ipsec profile
set [ find default=yes ] dpd-interval=2m dpd-maximum-failures=5
/system clock
set time-zone-name=America/New_York
