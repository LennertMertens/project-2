# Praktijk verslag week 03
## Overzicht bijgeleerde commando's
* No shutdown moet worden toegevoegd om een interface running te zetten.
* PC restarten na instellen van nic.
* Ip routes opvragen na aanmaken nieuwe route.
* Interfaces opvragen na activeren nieuwe interface.

## TTL
 * 255 -> Ping naar jezelf
 * 126 -> 1 hop
 * 125 -> 2 of meer hops

## Resetten van apparatuur
### Router
* Stroom onderbreken
* Connectie met console
* Stroom aanzetten
* Break signaal sturen
* Dan zit je in ROMMON, hier kan je de router resetten
https://supportforums.cisco.com/t5/network-infrastructure-documents/resetting-router-to-factory-default-removing-the-startup/ta-p/3131114

### Switch
* Knop indrukken tot de lichtjes knipperen 
* Switch> `erase startup-config`
* reload
