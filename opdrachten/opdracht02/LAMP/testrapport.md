# Testrapport Opdracht 02: LAMP automatisatie

## Gekozen configuratie
  * Wachtwoord root = max
  * Wachtwoord phpmyadmin = maxleire
  * 2048mb RAM
  * Drupal8 wordt geïnstalleerd
  * Naam hostmachine = maxmachine
## Alle te testen onderdelen in secties onderverdeeld

### Aanwezigheid van Deliverables

| Vereist       | Aanwezig      |
| ------------- |:-------------:|
| readme over gebruik |x|
| Vagrantfile         |x|
| vagrantConfig.sh (file met Vagrant configuraties) |x|
| lampStack.sh (script voor LAMP installatie |x|

### Vagrant server opstarten
- [x] Vagrant up start de machine
- [x] Er is geen gebruikerstussenkomst tijdens de installatie
- [x] De installatie verloopt zonder errors

### Vagrantfile

- [x] Naam van VM kan worden ingesteld
  * Kan in de vagrantfile
- [x] Netwerkkaarten worden geconfigureerd voor toegang vanop de host
  * Via vagrant ssh
- [x] Juiste besturingssysteem wordt meegegeven
  * Staat in de vagrantfile
- [x] Hoeveelheid RAM-geheugen kan worden ingesteld
  * Staat in de vagrantfile
- [x] vagrantConfig.sh wordt meegegeven
  * Staat in de vagrantfile
- [x] lampStack.sh wordt meegegeven
  * Staat in de vagrantfile
- [x] lampStack.sh zal automatisch worden uitgevoerd
  * Staat in de vagrantfile

### vagrantConfig.sh

- [x] Root wachtwoord kan worden ingesteld
  * Kan in de vagrantconfig file
- [x] SQL wachtwoord voor root gebruiker kan worden ingesteld
  * Kan in de vagrantconfig file
- [x] Optionele software kan worden geïnstalleerd (Drupal8)
  * Kan in de vagrantconfig file (comment of geen comment)

### lampStack.sh

- [x] Het script wordt automatisch uitgevoerd bij het opstarten van Vagrant
  * Instellingen zijn aangepast
- [x] Het script maakt gebruik van vagrantConfig.sh
  * Instellingen zijn aangepast naar de gekozen waarden
- [x] De installatie van de LAMP-Stack gebeurt zonder onderbrekingen 
- [x] Duidelijke berichten worden in het script weergegeven om de gebruiker op de hoogte te houden
- [x] Na de uitvoering van het script kunnen we aanloggen op de VM
  * Via `vagrant ssh`

## Werking van de LAMP stack
### Stappen voor het testen
- Nagaan van de IP addressseringen: `ip a`
- IP adres Host-Only adapter: `172.28.128.3`
- Nagaan of alle services draaien - `sudo systemctl status`

### Tests

- [x] Inloggen als root
  * Aanmelden met root + gekozen wachtwoord werkt
- [x] Webserver is beschikbaar vanop het Hostsysteem
  * Vanop hostsysteem surfen naar host-only virtualboxmachine adapter adres - dit toont de fedora test page
- [x] PhpMyAdmin is bereikbaar vanop het Hostsysteem
  * Vanop hostsysteem surfen naar host-only virtualboxmachine adapter adres + `/phpmyadmin` - dit toont de phpmyadmin login pagina
- [x] Drupal8 is bereikbaar vanop het Hostsysteem (indien dit werd mee geïnstalleerd)
  * Vanop hostsysteem surfen naar host-only virtualboxmachine adapter adres + `/drupal8` - dit toont de configuratiepagina van drupal8

### PhpMyAdmin tests
- [x] Inloggen met root user en gekozen wachtwoord (in vagrantConfig) werkt
  



Auteur testrapport: Maximilian Leire


