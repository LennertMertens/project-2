#VARIABELEN
#
#voert de exe uit met optie /s om het zonder interactie te doen. "Silent"
$java = ".\jre-8u161-windows-x64.exe /s"
#loactie van de config file voor sql server
$configfile = "C:\Users\Administrator\Documents\ConfigurationFile.ini"
#commando voor het uitvoeren van de SETUP.EXE die gekopieerd is, met het SAPWD argument om een wachtwoord in te stellen op het SA account in SQL-server.
$command = "C:\SQLServer2017Media\ExpressAdv_ENU\SETUP.EXE /SAPWD=Admin2018 /ConfigurationFile=$($configfile)"
#Locatie map waar alle bestanden staan om gekopieerd te worden naar de juiste locatie.
$locatiebestanden = "E:\"
#locatei download map
$downloads = "C:\Users\Administrator\Downloads\"
#locatie van de documents map
$documents = "C:\Users\Administrator\Documents\"
#Path voor de locatie van de SSMS installer?
$filepath="$downloads\SSMS-Setup-ENU.exe"
#Download URL voor SSMS
$urlssms = "https://go.microsoft.com/fwlink/?linkid=867670"
#Stuk commando voor een web connectie voor te downloaden.
$clnt = New-Object System.Net.WebClient
#Download URL Java
$urljava = "http://javadl.oracle.com/webapps/download/AutoDL?BundleId=230542_2f38c3b165be4555a1fa6e98c45e0808"
#
#DOWNLOADEN VAN BENODIGDHEDEN
#
Clear-Host
Write-Host "Downloaden van benodigde bestanden..." -ForegroundColor Green
sleep 5
clear-host
write-host "Downloading SQL Server 2017 SSMS..." -ForegroundColor Green
sleep 2
$clnt.DownloadFile($urlssms,"$filepath")
Write-Host "SSMS installer download complete!" -ForegroundColor Green
sleep 2
Clear-Host
write-host "Downloading Java EXE..." -ForegroundColor Green
sleep 2
$clnt.DownloadFile($urljava,"$downloads\jre-8u161-windows-x64.exe")
Write-Host "Java EXE download complete!" -ForegroundColor Green
sleep 2
Clear-Host
#
#KOPIEREN VAN BESTANDEN NAAR DE JUISTE PLEK
#
Clear-Host
Write-Host "Kopieren van benodigde bestanden..." -ForegroundColor Green
sleep 2
Clear-Host
sleep 2
Write-Host "Bezig met kopieren van SQL Setup Files ..." -ForegroundColor Green
sleep 2
Copy-Item $locatiebestanden\SQLServer2017Media\ -Destination "C:\SQLServer2017Media\" -Recurse
Write-Host "Klaar met kopieren!" -ForegroundColor Green
sleep 2
Clear-Host
Write-Host "Bezig met kopieren van ConfigurationFile SQL Server..." -ForegroundColor Green
sleep 2
Copy-Item $locatiebestanden\ConfigurationFile.ini -Destination $documents -Recurse
Write-Host "Klaar met kopieren!" -ForegroundColor Green
sleep 2
#
#INSTALLEREN VAN IIS-MANAGER ROLE EN ASP.NET
#
Clear-Host
sleep 2
Write-Host "Bezig met installeren van IIS-Manager en ASP.NET ..." -ForegroundColor Green
sleep 2
import-module servermanager
add-windowsfeature Web-Server, Web-WebServer, Web-Security, Web-Filtering, Web-Cert-Auth, 
Web-IP-Security, Web-Url-Auth, Web-Windows-Auth, Web-Basic-Auth, Web-Client-Auth, Web-Digest-Auth, 
Web-CertProvider, Web-Common-Http, Web-Http-Errors, Web-Dir-Browsing, Web-Static-Content, Web-Default-Doc, 
Web-Http-Redirect, Web-DAV-Publishing, Web-Performance, Web-Stat-Compression, Web-Dyn-Compression, 
Web-Health, Web-Http-Logging, Web-ODBC-Logging, Web-Log-Libraries, Web-Custom-Logging, 
Web-Request-Monitor, Web-Http-Tracing, Web-App-Dev, Web-Net-Ext, Web-Net-Ext45, Web-ASP, Web-Asp-Net, 
Web-Asp-Net45, Web-CGI, Web-ISAPI-Ext, Web-ISAPI-Filter, Web-WebSockets, Web-AppInit, Web-Includes, 
Web-Mgmt-Tools, Web-Mgmt-Console, Web-Mgmt-Compat, Web-Metabase, Web-WMI, Web-Lgcy-Mgmt-Console, 
Web-Lgcy-Scripting, Web-Scripting-Tools, Web-Mgmt-Service
#
#UITVOEREN VAN DE JAVA EXE, SQL-INSTALLATIE EN CONFIGURATIE
#
Clear-Host
Sleep 2
Write-Host "Bezig met installeren van java extensie..." -ForegroundColor Green
Sleep 2
cd $downloads
Invoke-Expression -Command $java
Clear-Host
Sleep 2
Write-Host "Java extensie geinstalleert!" -ForegroundColor Green
Sleep 2
Clear-Host
Sleep 2
Write-Host "Bezig met installeren van SQL Express Server..." -ForegroundColor Green
Sleep 2
cd \
Invoke-Expression -Command $command
Clear-Host
Write-Host "SQL Server is geinstalleerd en ingesteld!" -ForegroundColor Green
Sleep 2
Clear-Host
#
#INSTALLEREN SSMS
#
Clear-Host
write-host "Bezig met installeren van SSMS 2017..." -ForegroundColor Green
sleep 2
$Parms = " /Install /Quiet /Norestart /Logs log.txt"
$Prms = $Parms.Split(" ")
& "$filepath" $Prms | Out-Null
Write-Host "SSMS installation complete" -ForegroundColor Green
sleep 2
Clear-Host
#
#EINDE SCRIPT
#
Write-Host "WISA Succesvol!" -ForegroundColor Green
sleep 2