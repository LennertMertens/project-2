# Documentatie: Opzetten LAMP op Fedora 27

## Problemen bij een nieuwe installatie (enkel bij gebruik van CentOs7)

- Bij het uitvoeren van `$ sudo yum update` wordt er een fout weergegeven die zegt: `cannot find a valid baseurl for repo base/7/x86_64'
- Dit lossen we eerst op door `$ sudo dhclient` uit te voeren. Dit zorgt ervoor dat we kunnen connecteren en zet je netwerk device up and running.
- Het netwerkdevice moet `ONBOOT=Yes` worden aangezet, dit doen we in de `/etc/sysconfig/network-scripts/ifcfg-enp0s3` file.

## Installatie apache

### Installatie

- sudo dnf install httpd

### Services opstarten
- sudo systemctl start httpd

### Services starten bij opstarten systeem
- sudo systemctl enable httpd mod_ssl

### Testen of je de testpagina ziet
- surf naar 127.0.0.1 en het ip van het toestel (ip a)

### Firewall-configuratie
- firewall-cmd --add-service=http
- firewall-cmd --add-service=https
- firewall-cmd --add-service=http --permanent
- firewall-cmd --add-service=https --permanent

### Mysql en phpMyAdmin installatie
## Installatie
- sudo dnf install mariadb-server mariadb php phpMyAdmin
- sudo systemctl start mariad
- sudo systemctl status mariad
- sudo systemctl enable mariadb
- sudo systemctl restart httpd

## mysql_secure_installation
- Kies een root-wachtwoord
- Antwoord "Y" op alle vragen
Testen of dit werkt:
mySql -uroot -p (en geef het wachtwoord in)

### Toegang te krijgen tot phpMyAdmin
- Open `sudo vim /etc/httpd/conf.d/phpMyAdmin.conf`
- Verander onder <Directory /usr/share/phpMyAdmin/> 
                 <IfModule mod_authz_core.c>
  het IPv4 en IPv6 adres en vervang deze lijnen door: `Require all granted`
- sudo systemctl restart httpd mariadb

### Drupal8
## Installatie drupal
- sudo dnf install drupal8
- sudo cp /usr/share/drupal8/sites/default/default.settings.php /usr/share/drupal8/sites/default/settings.php
- sudo chown apache /usr/share/drupal8/sites/default/settings.ph

### Het toestel herstarten
- sudo reboot


## Netwerkkaarten (probleem/oplossing)

We kunnen gebruik maken van een NAT kaart voor een connectie met het internet, deze zal standaard het `IP 10.0.2.15` krijgen. Wanneer we vanop de host proberen te surfen naar dit IP adres dan zal dit niet mogelijk zijn.

-Opteer voor een `Bridged adapter` of een `Host-Only adapter` 
- bekijk binnen de VM wat van deze kaart(en) het IP adress is en surf naar dit adres vanop de host. Als alles goed is gegaan kunnen we nu connecteren met de webserver.

### handige commando's
- Alle IP's van de netwerkkaarten kunnen we opvragen met `ip a` (Fedora)


 






