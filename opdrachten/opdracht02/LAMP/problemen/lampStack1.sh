#!/bin/bash

#Kleurtjes
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m' #No Color

echo -e ${CYAN}"Made by Jens Neirynck & Lennert Mertens"${NC}

# Problemen bij een nieuwe installatie CentOS
#echo -e ${PURPLE}Problemen bij een nieuwe installatie verhelpen${NC}
#sudo dhclient
#sed -i 's/ONBOOT=No/ONBOOT=Yes/g' /etc/sysconfig/network-scripts/ifcfg-enp0s3
#echo -e ${PURPLE}Problemen bij een nieuwe installatie verhelpen: DONE${NC}

## Installatie apache
echo -e ${PURPLE}Apache installeren${NC}
sudo dnf install -y httpd
sudo systemctl start httpd
sudo systemctl enable httpd
firewall-cmd --add-service=http
firewall-cmd --add-service=https
firewall-cmd --add-service=http --permanent
firewall-cmd --add-service=https --permanent
echo -e ${PURPLE}Apache installeren: DONE${NC}

##MySql en PhpMyAdmin Installatie
echo -e ${PURPLE}Mysql en phpMyAdmin installatie${NC}
sudo dnf install -y mariadb-server mariadb php phpMyAdmin
sudo systemctl start mariadb
sudo systemctl enable mariadb
sudo systemctl restart httpd

echo -e ${PURPLE}Mysql en phpMyAdmin installatie: DONE${NC}

##MySql configuratie
echo -e ${PURPLE}Mysql configuratie${NC}
mysql_secure_installation <<EOF

y
root
root
y
y
y
y
EOF

echo -e ${PURPLE}Mysql configuratie: DONE${NC}


##Toegang krijgen tot phpMyAdmin
echo -e ${PURPLE}Toegang krijgen tot phpMyAdmin${NC}
wget neirynck.nu/project/phpMyAdmin.conf
sudo cp phpMyAdmin.conf /etc/httpd/conf.d/phpMyAdmin.conf
echo -e ${PURPLE}Toegang krijgen tot phpMyAdmin: DONE${NC}

##Drupal8
echo -e ${PURPLE}Installatie drupal8${NC}
sudo dnf install -y drupal8 mod_ssl
sudo cp /usr/share/drupal8/sites/default/default.settings.php /usr/share/drupal8/sites/default/settings.php
sudo chown apache /usr/share/drupal8/sites/default/settings.php
echo -e ${PURPLE}Installatie drupal8: DONE${NC}

echo -e ${GREEN}DE LAMP STACK IS SUCCESVOL GEINSTALLEERD... HET TOESTEL ZAL NU REBOOTEN${NC}
sudo reboot
