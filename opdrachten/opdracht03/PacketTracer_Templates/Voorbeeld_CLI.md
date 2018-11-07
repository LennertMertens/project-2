# CLI
## IP Tabel
|Toestel|Interface|IP-adres|
|:------:|:--------|:-------|
|R1|G0/0.10|192.168.10.1|
|R1|G0/0.20|192.168.20.1|
|P1|Nic|192.168.10.3|
|P2|Nic|192.168.10.4|
|P3|Nic|192.168.10.5|
|NAS|Nic|192.168.10.2|

## DHCP netwerk & pool naam Tabel
|VLAN|Pool Naam|Netwerk|Default-router|
|:--:|:--------|:------|:-------------|
|*VLAN 10*|LAN-POOL-INTERN|192.168.10.0|192.168.10.1|
|*VLAN 20*|LAN-POOL-GAST|192.168.20.0|192.168.10.1|

## Basis configuratie Router1
```
Router>enable
Router#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Router(config)#hostname R1
R1(config)#no ip domain-lookup
R1(config)#enable secret class
R1(config)#line console 0
R1(config-line)#password cisco
R1(config-line)#login
R1(config-line)#exit
R1(config)#banner motd #
Enter TEXT message.  End with the character '#'.
Verboeden toegang voor onbevoegde leken!!! KGB Still Watching You!!!#

R1(config)#line vty 0 4
R1(config-line)#password cisco
R1(config-line)#login
R1(config-line)#exit
R1(config)#service password-encryption 
R1(config)#end
R1#
%SYS-5-CONFIG_I: Configured from console by console

R1#copy running-config startup-config 
Destination filename [startup-config]? 
Building configuration...
[OK]
R1#
```

## Basis configuratie Switch1
```
Switch>enable
Switch#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
Switch(config)#hostname S1
S1(config)#enable secret class
S1(config)#line console 0
S1(config-line)#password cisco
S1(config-line)#login
S1(config-line)#line vty 0 15
S1(config-line)#password cisco
S1(config-line)#login
S1(config-line)#exit
S1(config)#service password-encryption
S1(config)#end
S1#
%SYS-5-CONFIG_I: Configured from console by console

S1#copy running-config startup-config 
Destination filename [startup-config]? 
Building configuration...
[OK]
S1#
```

## Switch VLAN en preparatie router-on-a-stick configuratie
```
S1(config)#
S1(config)#vlan 10
S1(config-vlan)#name Intern
S1(config-vlan)#vlan 20
S1(config-vlan)#name Gast
S1(config-vlan)#exit
S1(config)#int g0/1
S1(config-if)#switchport mode trunk
S1(config-if)#no shut
S1(config-if)#exit
S1(config-if)#
%LINK-5-CHANGED: Interface Vlan1, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface Vlan1, changed state to up

S1(config-if)#end
S1#
%SYS-5-CONFIG_I: Configured from console by console

S1#copy running-config startup-config 
Destination filename [startup-config]? 
Building configuration...
[OK]
S1#
```

## Router router on-a-stick configuratie
```
R1#
R1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
R1(config)#int g0/1.10
R1(config-subif)#encapsulation dot1q 10
R1(config-subif)#ip address 192.168.10.1 255.255.255.0
R1(config-subif)#int g0/1.20
R1(config-subif)#encapsulation dot1q 20
R1(config-subif)#ip address 192.168.20.1 255.255.255.0
R1(config-subif)#int g0/1
R1(config-if)#no shut

R1(config-if)#
%LINK-5-CHANGED: Interface GigabitEthernet0/0, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/0, changed state to up

%LINK-5-CHANGED: Interface GigabitEthernet0/0.10, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/0.10, changed state to up

%LINK-5-CHANGED: Interface GigabitEthernet0/0.20, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/0.20, changed state to up

%LINK-5-CHANGED: Interface GigabitEthernet0/0.88, changed state to up

%LINEPROTO-5-UPDOWN: Line protocol on Interface GigabitEthernet0/0.88, changed state to up

R1(config-if)#exit
R1(config)#
```

## Configuratie DHCP
```
R1>enable
R1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
R1(config)#ip dhcp pool LAN-POOL-INTERN
R1(dhcp-config)#network 192.168.10.0 255.255.255.0
R1(dhcp-config)#default-router 192.168.10.1
R1(dhcp-config)#exit
R1(config)#ip dhcp excluded-address 192.168.20.1
R1(config)#ip dhcp pool LAN-POOL-GAST
R1(dhcp-config)#network 192.168.20.0 255.255.255.0
R1(dhcp-config)#default-router 192.168.10.1
R1(dhcp-config)#exit
R1(config)#ip dhcp excluded-address 192.168.10.1 192.168.10.30
R1(dhcp-config)#exit
R1(config)#end
R1#copy running-config startup-config 
Destination filename [startup-config]? 
Building configuration...
[OK]
R1#
```

## Toekennen van VLAN's aan poorten switch1
```
S1#conf t
Enter configuration commands, one per line.  End with CNTL/Z.
S1(config)#int range fa 0/1-23
S1(config-if-range)#switchport access vlan 10
S1(config-if-range)#exit
S1(config)#int fa 0/24
S1(config-if)#switchport access vlan 20
S1(config-if)#exit
S1(config)#ip default-gateway 192.168.100.1
S1(config)#int g0/1
S1(config-if)#switchport mode trunk
S1(config-if)#no shut
S1(config-if)#exit
S1(config)#end
S1#copy running-config startup-config 
Destination filename [startup-config]? 
Building configuration...
[OK]
S1#
```
