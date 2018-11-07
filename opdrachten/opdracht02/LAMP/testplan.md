# Testplan Opdracht 02: LAMP automatisatie

Vooraleer je het testplan gaat doorlopen, gelieve eerst de [readme.md](https://github.com/HoGentTIN/p2ops-g09/blob/master/opdrachten/opdracht02/LAMP/deliverables/readme.txt) door te nemen. In dit bestand staan alle te doorlopen stappen beschreven.

## Alle te testen onderdelen in secties onderverdeeld: 

### Aanwezigheid van Deliverables

| Vereist       | Aanwezig      | Commentaar |
| ------------- |:-------------:| ---------- |
| readme over gebruik | |   |
| Vagrantfile         | |   |
| vagrantConfig.sh (file met Vagrant configuraties) | |   |
| lampStack.sh (script voor LAMP installatie | |   |

### Vagrant server opstarten
- [ ] Vagrant up start de machine
- [ ] Er is geen gebruikerstussenkomst tijdens de installatie
- [ ] De installatie verloopt zonder errors

### Vagrantfile

- [ ] Naam van VM kan worden ingesteld
- [ ] Netwerkkaarten worden geconfigureerd voor toegang vanop de host
- [ ] Juiste besturingssysteem wordt meegegeven 
- [ ] Hoeveelheid RAM-geheugen kan worden ingesteld
- [ ] vagrantConfig.sh wordt meegegeven
- [ ] lampStack.sh wordt meegegeven
- [ ] lampStack.sh zal automatisch worden uitgevoerd

### vagrantConfig.sh

- [ ] Root wachtwoord kan worden ingesteld
- [ ] SQL wachtwoord voor root gebruiker kan worden ingesteld
- [ ] Optionele software kan worden geïnstalleerd (Drupal8)
- [ ] De gebruiker kan ook kiezen om de optionele software niet te installeren

### lampStack.sh

- [ ] Het script wordt automatisch uitgevoerd bij het opstarten van Vagrant
- [ ] Het script maakt gebruik van vagrantConfig.sh
- [ ] De installatie van de LAMP-Stack gebeurt zonder onderbrekingen 
- [ ] Duidelijke berichten worden in het script weergegeven om de gebruiker op de hoogte te houden
- [ ] Na de uitvoering van het script kunnen we aanloggen op de VM


## Werking van de LAMP stack
### Stappen voor het testen
- Nagaan van de IP addressseringen: `ip a`
- IP adres Host-Only adapter: `x.x.x.x` (hier invullen)
- Nagaan of alle services draaien

### Tests 

- [ ] Inloggen als root
- [ ] Webserver is beschikbaar vanop het Hostsysteem
- [ ] PhpMyAdmin is bereikbaar vanop het Hostsysteem
- [ ] Drupal8 is bereikbaar vanop het Hostsysteem (indien dit werd mee geïnstalleerd)

### PhpMyAdmin tests
- [ ] Inloggen met root user en gekozen wachtwoord (in vagrantConfig) werkt



Auteur(s) testplan: Lennert Mertens & Maximilian Leire


