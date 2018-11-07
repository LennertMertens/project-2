# Documentatie Lab 2: Building A Simple Network

### Benodigdheden
* 2X Cisco 2960 switch
* 2X Host Pc
* 3X ethernet cable

### Switch terugzetten naar fabrieksinstellingen
* Switch> `enable`
* Switch# `show flash`
* Switch# `delete vlan.dat`
* Switch# `erase startup-config`
* Switch# `reload`

## Deel 1: Set Up the Network Topology (Ethernet only)
### Stap 1: Zet de apparaten aan
* Zorg dat alle toestellen ingeplugd zijn in het stopcontact. De switches hebben geen power knop.
* Start de computers op door op de power knop vanachter van toestand te veranderen en druk op de power-on knop vandoor.
### Stap 2: Verbind de 2 Switches
* Plug een ethernet kabel in poort 1 van switch 1 en verbind het andere uiteinde met poort 1 van Switch 2.
### Stap 3: Verbind de PC’s met de switches
* Plug een ethernet kabel in de nic van de pc host en verbind het andere einde met een poort van switch 1.
* Doe het zelfde voor de tweede pc hots maar dan in een poort van Switch 2.
### Stap 4: Inspecteer visueel de connecties.
* Controleer of elke kabel zeker goed ingeplugd is. Dit zorgt ervoor dat we later minder tijd hoeven te spenderen aan het troubleshooten van het netwerk.

## Deel 2: Configureer de PC hosts
### Stap 1: Configureer een statisch ip-adres op de PC’s
* Klik op het windows icoontje op de taakbalk en ga naar het configuratie scherm.
* Klik onder “netwerk en internet” de link “netwerkstatus en -taken weergeven” aan.
* Klik links op de link “adapterinstellingen wijzigen”
* Rechtermuis klik op de “local area connection” en selecteer de “eigenschappen”
* Selecteer de “internet protocol versie 4 (TCP/IPv4)” en kijk dan op “eigenschappen”
* Klik op  “Het volgende IP-adres gebruiken” en vul de gepaste informatie in. Voor PC-A het ip-adres 192.168.1.10 en voor PC-B het ip-adres 192.168.1.11.
* Klik OK twee maal achter elkaar.
* Herhaal deze stappen voor de andere pc host.
### Stap 2: Controleer de pc instelling en de verbinding
* Klik op het windows teken in de taakbalk en typ `cmd`.
* Type `ipconfig /all` en druk enter. Controleer alle instelling zoals de host naam en het ip-adres met zijn bijhorende subnetmask.
* Type `ping 192.168.1.11` en druk enter. Voor pc-b, type `ping 192.168.1.10`
* Controleer of er geen enkel pakket gedropt wordt.
* Herhaal dit voor de andere pc host.

## Deel3: Configureer en controleer de basisch instellingen van de switches
### Stap 1: Verbind met de cli van de switch.
* Gebruik hiervoor Tera Term zoals beschreven in het vorige labo.
* Gebruik PC-A voor switch 1 te configureren en PC-B voor switch 2.
### Stap 2: Ga naar privileged EXEC mode.
* Druk enter.
* Type `enable`.
* Druk enter.
* Controleer of er van “Switch>” naar “Switch#” is gegaan.
### Stap 3: Enter de configuratie modus.
* Type `configure terminal` en druk enter.
* Controleer of er nu “Switch(config)#” staat.
### Stap 4: Geef de switch een naam.
* Type `hostname S1` en druk enter. Voor switch 2 typ `hostname S2`.
* Controleer of “Switch(config)#” veranderd is naar “S1(Config)#”.
### Stap 5: Voorkom ongewilde DNS lookups.
* Type `no ip domain-lookup` en druk enter.
### Stap 6: Stel de lokale wachtwoorden in.
* Type `enable secret class` en druk enter. Dit zorgt ervoor dat er een ge-encrypteerd wachtwoord staat op de privileged EXEC modus.
* Type `line con 0` en druk enter.
* Controleer of “S1(Config)#” veranderd is in “S1(Config-line)#”.
* Type `password Cisco` en druk enter. Dit heeft een wachtwoord ingesteld bij de initiële login op de CLI van deze switch.
* Type `login` en druk enter.
* Type `exit` en druk enter om terug naar global Configuration te gaan.
### Stap 7: Stel een MOTD banner in.
* Type `banner mond #` en druk enter.
* Type de gewenste tekst: `Unauthorized access is strictly prohibited and prosecuted to the full extent of the law. #` en druk enter.
* Type exit en druk enter.
### Stap 8: Sla de configuratie op.
* Type `copy running-config startup-config` en druk enter.
* Druk enter.
### Stap 9: Controleer de huidige configuratie van de switch.
* Type `show running-config` en druk enter.
* Controleer volgens deze afbeelding:

<img src=Afbeeldingen/S1_Running_Conf.png size=75%>

### Stap 10: Toon de info over de IOS versie.
* Type `show version` en druk enter.
* Controleer volgens volgende afbeelding:

<img src=Afbeeldingen/S1_Show_Version.png size=75%>

### Stap 11: Toon de status van de geconcentreerde poorten van de switch.
* Type `show ip interface brief` en druk enter.
* Controleer volgens deze afbeelding:

<img src=Afbeeldingen/S1_Show_Ip_Interface_Brief.png size=75%>

### Stap 12: Instellen van de tweede switch.
* Herhaal de bovenstaande stappen voor switch2.
