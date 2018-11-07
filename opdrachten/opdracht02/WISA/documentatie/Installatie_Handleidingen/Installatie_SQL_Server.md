# Documentatie: Installatie SQL Server

## Basisinstallatie SQL Server

### Stap 1:
* Surf naar https://www.microsoft.com/nl-be/sql-server/sql-server-downloads en download de Express-editie.
<img src="../Afbeeldingen/SQL-Server/SQL_1.PNG" width=600>

* Open de .exe en voer het uit.
<img src="../Afbeeldingen/SQL-Server/SQL_3.PNG" width=600>

### Stap 2:
* Klik op custom install.
<img src="../Afbeeldingen/SQL-Server/SQL_4.PNG" width=600>

* Verander eventueel de doel locatie/folder voor de installatie.

* Kies install en wacht.
<img src="../Afbeeldingen/SQL-Server/SQL_5.PNG" width=600>

 ### Stap 3:
 * Nadat de installatie klaar is wordt er automatisch een installer menu geopend. Kies hier onder de categorie `installation` voor: `New SQL Server stand-alone installation or add new features to an existing installation`.
 <img src="../Afbeeldingen/SQL-Server/SQL_6.PNG" width=600>
 
 ### Stap 4:
 * Accepteer de licentie overeenkomst na het lezen ervan en klik op next.
 <img src="../Afbeeldingen/SQL-Server/SQL_8.PNG" width=600>
 
 * Klik op next.
 <img src="../Afbeeldingen/SQL-Server/SQL_9.PNG" width=600>
 
 * Het installatie programma doet een aantal controles. Na afloop klik next.
 <img src="../Afbeeldingen/SQL-Server/SQL_10.PNG" width=600>
 
 * In het `Feature Selection` paneel klik op `Select All`. Verander ook eventueel de doel locatie/folder voor de installatie. Klik next.
 <img src="../Afbeeldingen/SQL-Server/SQL_11.PNG" width=600>

* Het installatie programma doet een controle ofdat er zich problemen kunnen voordoen tijdens het installatie-proces. Indien U onderstaande foutmelding krijgt ga naar Appendix A. Klik next.
<img src="../Afbeeldingen/SQL-Server/SQL_12.PNG" width=600>

* Kies `Named instance` als het nog niet geselecteerd is en geef een naam in. Klik hierna op next.
<img src="../Afbeeldingen/SQL-Server/SQL_25.PNG" width=600>

* In het PolyBase Configuration paneel kiest U de eerste optie vermits we een nieuwe stand alone node willen installeren en klik next.
<img src="../Afbeeldingen/SQL-Server/SQL_26.PNG" width=600>

* Het installatie programma toont nu een aantal opties voor gebruikers. Laat alles zoals aangegeven en klik next.
<img src="../Afbeeldingen/SQL-Server/SQL_27.PNG" width=600>

* Kies nu in het tab-blad `Server Configuration` voor de optie `Mixed Mode`. Dit is belangerijk omdat de meeste Applicaties automatisch de databank genereren volgens een script en dan gebruiken ze het standaard SA account in SQL-Server. Kies een wachtwoord en bevestig. Klik op next.
<img src="../Afbeeldingen/SQL-Server/SQL_62.PNG" width=600>

* Klik op accept. Daarna klik op next.
<img src="../Afbeeldingen/SQL-Server/SQL_33.PNG" width=600>

* Klik op accept. Daarna klik op next.
<img src="../Afbeeldingen/SQL-Server/SQL_34.PNG" width=600>

* De installatie begint nu. Dit kan enige tijd in beslag nemen. (+-10 minuten).
<img src="../Afbeeldingen/SQL-Server/SQL_35.PNG" width=600>

* Na afloop van de installatie toont het installatie programma een rapport van de installatie. Klik op close. De install menu opent terug.
<img src="../Afbeeldingen/SQL-Server/SQL_36.PNG" width=600>

### Stap 5:
* Selecteer in het installatie menu `Install SQL Server Reporting Services`.
<img src="../Afbeeldingen/SQL-Server/SQL_37.PNG" width=600>

* Er wordt een browser venster geopend. Klik op `Download now`. De download wordt gestart.
<img src="../Afbeeldingen/SQL-Server/SQL_39.PNG" width=600>

* Open de .exe en voer uit.
<img src="../Afbeeldingen/SQL-Server/SQL_40.PNG" width=600>

* Er wordt een nieuw isntallatie venster geopend. Klik op `install reporting services`.
<img src="../Afbeeldingen/SQL-Server/SQL_41.PNG" width=600>

* Verander de edition en klik op next.
<img src="../Afbeeldingen/SQL-Server/SQL_42.PNG" width=600>

* Accepteer de licentie overeenkomst na het lezen ervan en klik op next.
<img src="../Afbeeldingen/SQL-Server/SQL_43.PNG" width=600>

* Klik op next.
<img src="../Afbeeldingen/SQL-Server/SQL_44.PNG" width=600>

* Verander eventueel de doel locatie en klik next.
<img src="../Afbeeldingen/SQL-Server/SQL_45.PNG" width=600>

* De installatie begint nu. Na afloop van de installatie klik close.
<img src="../Afbeeldingen/SQL-Server/SQL_47.PNG" width=600>

### Stap 6:
* Selecteer in het installatie menu `Install SQL Server Management Tools`.
<img src="../Afbeeldingen/SQL-Server/SQL_37.PNG" width=600>

* Er wordt een browser venster geopend. Klik op `Download SQL Server Management Studio 17.5`. De download begint.
<img src="../Afbeeldingen/SQL-Server/SQL_51.PNG" width=600>

* Voer de .exe uit.
<img src="../Afbeeldingen/SQL-Server/SQL_52.PNG" width=600>

* Er wordt een nieuw installatie scherm geopend. Klik op install.
<img src="../Afbeeldingen/SQL-Server/SQL_53.PNG" width=600>

* Nadat de installatie afgelopen is klik op close.
<img src="../Afbeeldingen/SQL-Server/SQL_56.PNG" width=600>

## Appendix A:
### Stap 1:
* U heeft een foutmelding gekregen tijdens de controle ofdat het installatie proces onafgebroken kan doorgaan.
<img src="../Afbeeldingen/SQL-Server/SQL_12.PNG" width=600>

<img src="../Afbeeldingen/SQL-Server/SQL_13.PNG" width=600>

* Deze foutmelding komt alleen als U geen versie van java geinstalleert heeft op uw toestel.

* Ga naar google en zoek op `java`. Klik op `gratis java software downloaden`
<img src="../Afbeeldingen/SQL-Server/SQL_17.PNG" width=600>

* Klik op `gratis java download`.
<img src="../Afbeeldingen/SQL-Server/SQL_18.PNG" width=600>

* Klik op `Ga akkoord met de licentiebepaling en start de gratis dwonload`. De dowload zou nu moeten beginnen.
<img src="../Afbeeldingen/SQL-Server/SQL_20.PNG" width=600>

* Na afloop van de dowload run de .exe.
<img src="../Afbeeldingen/SQL-Server/SQL_21.PNG" width=600>

* Klik op `Install >`.
<img src="../Afbeeldingen/SQL-Server/SQL_22.PNG" width=600>

* Laat de installatie lopen.
<img src="../Afbeeldingen/SQL-Server/SQL_23.PNG" width=600>

* Als de installatie afgerond is, klik op `Close`.
<img src="../Afbeeldingen/SQL-Server/SQL_24.PNG" width=600>

* Ga nu terug naar het installatie programma van SQL Server en klik op `Re-Run`. Na afloop zou de next knop beschikbaar moeten zijn.
<img src="../Afbeeldingen/SQL-Server/SQL_12.PNG" width=600>
