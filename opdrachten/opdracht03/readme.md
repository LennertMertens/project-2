# Project VastGoed
*Map voor alle documenten & bestanden van opdracht rond VastGoed. Alle bestanden (facturen/pka opstellingen) dienen in het mapje van de juiste groep te worden geplaatst, dit houdt onze Github proper! Thanks!*

## Problemen
*Tijdens het uitvoeren van de proof of concept zijn we op een probleem gestoten. We moesten NAT toepassen om het door DHCP verkregen IP-adres van HoGent te mappen op onze interne private IP-adressen. Hier hebben we alle moeite mee gehad. Onderstaande stappenplan toont een werkwijze voor NAT(PAT Single global address).*

#### Controle default gateway meegegeven met DHCP in intern netwerk.
* Open op een client binnen intern netwerk een command prompt en controleer de IP configuratie `ipconfig`.
* Controleer op de ethernet adapter of er een default gateway meegegeven is en of het IP-adres binnen de range is van het interne netwerk. Als dit niet het geval is, controleer DHCP configuratie in CLI van router.

#### Controle DHCP configuratie op CLI van router.
* Typ:
```
R1>enable
R1#show running-config
```
* Controleer of er bij de DHCP pools een default-router is en ofdat er een adressen pool is meegegeven.

#### Instellen van NAT (PAT Single global address) zoals proof of concept
```
R1>enable
R1#conf t
R1(config)#access-list 1 permit 192.168.0.0 0.0.255.255
R1(config)#ip nat inside source list 1 interface f0/1
R1(config)#int f0/0.10
R1(config-if)#ip nat inside
R1(config-if)#int f0/0.20
R1(config-if)#ip nat inside
R1(config-if)#int f0/1
R1(config-if)#ip nat outside
R1(config-if)#end
R1#
