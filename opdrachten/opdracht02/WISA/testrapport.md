# Testplan Opdracht 02: WISA automatisatie

## Alle te testen onderdelen in secties onderverdeeld: 

### Aanwezigheid van Documentatie

| Vereist       | Aanwezig      | Commentaar |
| ------------- |:-------------:| ---------- |
| windows_2016_virtualbox.box |X |   |
| ConfigurationFile | X|   |
| GebruiksAanwijzing |X |   |
| Insitallatie_ASP.NET_Applicatie.md |X |   |
| Insitallatie_IIS&ASP_NET.md |X |   |
| Insitallatie_SQL_Server.md |X |   |
| Insitallatie_Windows_Server2016.md |X |   |
| Opzetten_Vagrant.md |X |   |

### Vagrant folder aanmaken
*Volg de gebruiksaanwijzing, [Voorbereiden van mappen en packages](https://github.com/HoGentTIN/p2ops-g09/blob/master/opdrachten/opdracht02/WISA/documentatie/GebruiksAanwijzing.md)*

- [X] Er is een map gemaakt met de benodigde bestanden.
- [X] Er bestaat een ConfigurationFile
- [X] Er bestaat een map SQLServer2017Media
- [X] Er bestaat een PowerShell script Setup.ps1
- [X] Er bestaat een VagrantFile
- [X] Er bestaat een VirtualBox Box windows_2016_virtualbox.box

### Vagrant server opstarten
*Volg de gebruiksaanwijzing, [Uitvoeren van de automatische configuratie](https://github.com/HoGentTIN/p2ops-g09/blob/master/opdrachten/opdracht02/WISA/documentatie/GebruiksAanwijzing.md)*

- [X] `vagrant box add --name windows_2016 windows_2016_virtualbox.box` voegt de box toe
- [X] Vagrant up start de machine
- [X] De installatie van Windows Server verloopt zonder errors

### ASP.NET & IIS

- [X] Surf op uw host systeem in uw browser naar `10.10.10.4`
- [X] Surf in uw virtualbox naar `localhost`
<img src="documentatie/Afbeeldingen/IIS_ASP_NET/IIS_19.PNG" width=400>

### SQL

- [X] SSMS (Sql Server Management Studio) is geinstalleert
- [x] Er kan verbinding gemaakt worden in SSMS met de databank

### VirtualBox toevoegen aan VirtualBox
*Volg de gebruiksaanwijzing, [Toevoegen van de virtuele machine aan VirtualBox](https://github.com/HoGentTIN/p2ops-g09/blob/master/opdrachten/opdracht02/WISA/documentatie/GebruiksAanwijzing.md)*

- [x] Er werd een VirtualBox toegevoegd aan VirtualBox

### Overige testen
*Volg de gebruiksaanwijzing, [Toevoegen van een applicatie](https://github.com/HoGentTIN/p2ops-g09/blob/master/opdrachten/opdracht02/WISA/documentatie/GebruiksAanwijzing.md)*

- [x] Er werd succesvol een webapplicatie toegevoegd op 1 van de 2 manieren
- [x] Surf op uw host systeem in uw browser naar `10.10.10.4`
- [x] Surf in uw virtualbox naar `localhost`

Auteur(s) testplan: Jens Neirynck
