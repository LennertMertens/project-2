# Documentatie: Installatie IIS & ASP.NET

## Basisinstallatie IIS & ASP.NET

### Stap 1:
* Ga in het Server Manager vestere naar `Add Roles And Features`.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_.PNG" width=600>

* Er opende een nieuw installatie venster. Klik op next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_2.PNG" width=600>

* Kies voor Role-based or feature-based installation en klik op next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_3.PNG" width=600>

* Klik op next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_4.PNG" width=600>

* Kies voor Web Server (IIS) en vink aan. Klik next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_6.PNG" width=600>

* Klik op Add Features.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_7.PNG" width=600>

* Zorg dat alles geselecteerd is zoals onderstaande afbeelding en klik op next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_8.PNG" width=600>

* Klik op next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_9.PNG" width=600>

* Selecteer alle opties op FTP Server na en klik next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_10.PNG" width=600>

<img src="../Afbeeldingen/IIS_ASP_NET/IIS_20.PNG" width=600>

<img src="../Afbeeldingen/IIS_ASP_NET/IIS_12.PNG" width=600>

* Klik op install.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_13.PNG" width=600>

* Na het eindigen van de installatie klik op close.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_15.PNG" width=600>

### Stap 2:
* Zoek nu in het Server Manager venster onder Tools naar de IIS manager en open de tool.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_16.PNG" width=600>

* Nu zouden onderstaande mappen zichtbaar moeten zijn.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_17.PNG" width=600>

* Open een nieuw browser venster en type in de adresbalk `localhost`. Druk enter.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_18.PNG" width=600>

* Als alles correct verlopen is dan zou nu onderstaande pagina moeten verschijnen.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_19.PNG" width=600>

## Appendix A:
*Er mankeren knoppen in de GUI van de IIS manager waardoor het toevoegen van een website moeilijk verloopt. Deze wizard brengt deze knoppen terug die in een oudere editie zaten.*
### Stap 1:
* Surf naar: https://www.iis.net/downloads/microsoft/web-deploy en download de extension.

* Voer de .exe uit.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_21.PNG" width=600>

* Er wordt een nieuw installatie scherm geopend. Klik op next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_22.PNG" width=600>

* Accepteer de licentie overeenkomst na het lezen ervan en klik op next.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_23.PNG" width=600>

* Kies voor `Typical`.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_24.PNG" width=600>

* Klik op Install.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_25.PNG" width=600>

* De installatie begint nu.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_26.PNG" width=600>

* Na het eindigen van de installatie klik op close.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_27.PNG" width=600>

## Appendix B:
*Vooraleer het mogelijk wordt om succesvol een applicatie toe te voegen in de IIS-Manager, moet er nog een pakket worden geinstalleerd.*
### Stap 1:
* Surf naar: https://microsoft.com/web/downloads/platform.aspx en download de extension.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_28.PNG" width=600>

* Voer de .exe uit.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_29.PNG" width=600>

* Accepteer de licentie overeenkomst na het lezen ervan en klik op install.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_30.PNG" width=600> 

* De installatie begint nu.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_31.PNG" width=600>

* Na het eindigen van de installatie klik op finish.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_32.PNG" width=600>

### Stap 2:
* Zoek naar de applicatie: `Web Platform Installer 5.0` en open de applicatie.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_33.PNG" width=600>

* Na het openen ga naar het tapblad `Products`.

* Zoek onder de categorie `Database` naar `SQL Server 2008 R2 Management Objects` en klik op Add.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_34.PNG" width=600>

* Klik dan op install
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_35.PNG" width=600>

* Er opende een nieuw installatie venster. Klik op I Accept.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_36.PNG" width=600>

* De installatie zou nu moeten beginnen.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_37.PNG" width=600>

* Na het eindigen van de installatie klik op Finish.
<img src="../Afbeeldingen/IIS_ASP_NET/IIS_38.PNG" width=600>

## Appendix C:
*Installeren van de IIS-Manager en de ASP.NET Rollen via powershell.*
### Stap 1:
* Open Powershell ISE.

* Type regel per regel:
```
install-windowsfeature -name Web-Server -includeallsubfeature -IncludeManagementTools -Confirm:$false
install-windowsfeature -name NET-Framework-Features -includeallsubfeature -Confirm:$false
install-windowsfeature -name NET-Framework-45-Features -includeallsubfeature -Confirm:$false
```
* Alle benodigde features zijn geinstalleerd. 
