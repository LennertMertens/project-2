# Documentatie: Wegwijs met vagrant

## 1. Installatie

Vooraleer we van start willen gaan met Vagrant dienen we dit te installeren samen met Virtual Box. Bij Virtual box gebruiken we eveneens het Extension pack.

* Download `Vagrant`: https://www.vagrantup.com/
* Download `Virtual Box`: https://www.virtualbox.org/
* Download `Virtual Box Extension Pack`: http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html#extpack

## 2. Vagrant opzetten

* Open `Command prompt`
* Maak een nieuwe map aan waarbinnen we Vagrant gaan opzetten: `$ mkdir voorbeeldmap_vagrant`
* Verander je huidige map naar de nieuwe: `$ cd voorbeeldmap_vagrant`
* Maak de `Vagrantfile` aan in de huidige directory: `$ vagrant init`
* Open de `Vagrantfile` in Windows: `> start "" Vagrantfile`, in Unix: `$ vi Vagrantfile`
* Lees de `Vagrantfile` door
* Pas `config.vm.box="base"` aan. Vervang "Base" door de boxnaam dat we wensen te gebruiken
* Boxes kunnen worden teruggevonden op: https://app.vagrantup.com/boxes/search
* Na gebruik van bijvoorbeeld Ubuntu/wily, dan passen we de `Vagrantfile` aan: `config.vm.box="Ubuntu/wily64"`
* Box opzetten: `$ vagrant up` (Maakt en configureert de VM)
* Verbinding maken met de box: `$ vagrant ssh`
* Terugkeren uit de ssh sessie: `$ exit`
* Vagrant machine uitzetten: `$ vagrant halt`
* Volledige Vagrant box verwijderen: `$ vagrant destroy` (opm. De box blijft in de cache van de computer)


## 3. Vagrantfile en VM specifications

* Open de `Vagrantfile`: `> start "" Vagrantfile`

### VM Specificaties
* Ga naar `Provider specific configuration`
* In deze section gaan we commentaar verwijderen en een aantal zaken aanpassen waaronder de vm een naam geven:
``` 
...
# Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  
   config.vm.provider "virtualbox" do |vb|
     # Display the VirtualBox GUI when booting the machine
     vb.gui = false
	
     # Option to name the VM
     vb.name = "MyProject"
  
     # Customize the amount of memory on the VM:
     vb.memory = "1024"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.
  ...
```

### VM netwerk beschikbaar maken voor connectie via host systeem
* Ga naar `Private network section`
``` 
# Create a private network, which allows host-only access to the machine
  # using a specific IP.
    config.vm.network "private_network", ip: "192.168.33.10"
```

### Guest OS host name aanpassen
* Ga naar `Vagrat configuration` (Bovenaan Vagrantfile)
* Voeg `config.vm.hostname = "guest"` toe en schakel het zoeken naar updates uit => Versnelt de VM
```
# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://vagrantcloud.com/search.
  config.vm.box = "centos/7"

  config.vm.hostname = "guest"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
    config.vm.box_check_update = false
 ...
```

* Sla na de aanpassingen de `Vagrantfile` op en reload de Vagrant box met= `$ vagrant reload`


## 4. Provisioning

*Provisioning zorgt ervoor dat we een hele development environment kunnen opzetten aan de hand van 1 simpel commando. Het is een script/serie van scripts dat Vagrant aanroept wanneer de VM voor de eerste keer wordt opgestart. Zo kan je het script dat hiervoor zorgt instellen om te runnen in de Vagrantfile*

* Open de `Vagrantfile`
* Edit de vagrantfile onderaan net voor de laatste "end"
* Voeg configuratie toe dat ervoor zorgt dat script: `provision.sh` in de guest OS wordt uitgevoerd
```
 # SHELL

  config.vm.provision :shell, :path => "provisioning.sh"
end
```

* Maak het `provisioning.sh` script aan en vul het aan:
```
#!/bin/bash

apt-get update
apt-get upgrade

# In andere Linux distributies kan gebruik worden gemaakt van andere packet managers (vb. yum, dnf)
```

* Maak het script executable: `$ chmod +x provisioning.sh`
* Stop vagrant: `$ vagrant halt`
* Herstart vagrant met de juiste parameter: `$ vagrant up --provision` (we geven de parameter mee omdat Vagrant eerder al werd opgstart. Wanneer je Vagrant voor de eerste keer zou starten, dan voert hij de scripts automatisch uit)
* Wanneer alles goed gaat dan zou je moeten zien dat de VM update en upgrade.


### Bronnen
* https://www.sitepoint.com/getting-started-vagrant-windows/
* https://www.vagrantup.com/intro/getting-started/project_setup.html
* https://www.youtube.com/watch?v=L8a62rGlFdw (en alle volgende filmpjes omtrent Vagrant)
