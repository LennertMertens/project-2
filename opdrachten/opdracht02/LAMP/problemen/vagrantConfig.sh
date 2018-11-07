# !/bin/bash
echo "config start"

#################################

# Projectnaam
# Geef hier de naam in die je aan je project wenst te geven
export PROJECT_NAME="testproject"


# Root paswoord dat u wenst te gebruiken

export FEDORA_ROOT="class"


# SQL settings die je wenst te gebruiken
# SQL paswoord

export MYSQL_ROOT_PASS="class"

# Installatie optionele softwarepaketten
# In volgende lijn kan u kiezen om een CMS systeem te installeren
# u kan kiezen voor drupal8 

export SOFTWARE="drupal8"

#################################

echo "Vars van config"
echo $PROJECT_NAME
echo $FEDORA_ROOT
echo $MYSQL_ROOT_PASS
echo $SOFTWARE


source /home/vagrant/lampStack.sh
