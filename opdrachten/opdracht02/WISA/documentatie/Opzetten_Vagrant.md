# Documentatie: Opzetten Vagrant

### Benodigdheden

* Virtualbox
* Chocolatey
* Cmder
* Vagrant
* Packer

## Stap 1: Voorbereiding

### Installatie programma's

Zorg dat Virtualbox, cmder, Vagrant, Chocolatey en Packer geïnstalleerd zijn op je machine.

Installer Packer via: `choco install packer` .

Zorg dat cmder, vagrant en virtualbox toegevoegd zijn aan je PATH-variabele.

1. Druk op `Win + R` en type `systempropertiesadvanced`
2. Klik op de knop `Environment Variables` .
3. Selecteer bij <b>System variables</b> de rij `Path` en druk op `edit` .
4. Voeg nu de mappen voor Virtualbox, vagrant en cmder toe.
5. Druk op `OK`.

Standaard installatiefolders:  

C:\tools\cmder  
C:\Program Files (x86)\Oracle\VirtualBox  
C:\HashiCorp\Vagrant\bin  

### Aanmaken van een mappenstructuur


1. Open <b>Cmder</b>
2. Type: `mkdir \Vagrant`
3. Type: `cd \Vagrant`
4. Type: `git clone https://github.com/joefitzgerald/packer-windows.git`
5. Unzip de gedownloade Packer-bestanden in dit mapje.


## Stap 2: Het bouwen van de Windows basis box via Packer

Open de file <b>windows_2016.json</b> in het gekloonde mapje. En vervang alles door onderstaande code.

```
{
  "builders": [
    {
      "type": "virtualbox-iso",
      "iso_url": "{{user `iso_url`}}",
      "iso_checksum_type": "{{user `iso_checksum_type`}}",
      "iso_checksum": "{{user `iso_checksum`}}",
      "headless": false,
      "boot_wait": "2m",
      "ssh_username": "vagrant",
      "ssh_password": "vagrant",
      "ssh_wait_timeout": "8h",
      "shutdown_command": "shutdown /s /t 10 /f /d p:4:1 /c \"Packer Shutdown\"",
      "guest_os_type": "Windows2016_64",
      "disk_size": 61440,
      "floppy_files": [
        "{{user `autounattend`}}",
        "./scripts/microsoft-updates.bat",
        "./scripts/win-updates.ps1",
        "./scripts/openssh.ps1"
      ],
      "vboxmanage": [
        [
          "modifyvm",
          "{{.Name}}",
          "--memory",
          "2048"
        ],
        [
          "modifyvm",
          "{{.Name}}",
          "--cpus",
          "2"
        ]
      ]
    }
  ],
  "provisioners": [
    {
      "type": "shell",
      "remote_path": "/tmp/script.bat",
      "execute_command": "{{.Vars}} cmd /c C:/Windows/Temp/script.bat",
      "scripts": [
        "./scripts/vm-guest-tools.bat",
        "./scripts/vagrant-ssh.bat",
        "./scripts/enable-rdp.bat",
        "./scripts/compile-dotnet-assemblies.bat",
        "./scripts/disable-auto-logon.bat",
        "./scripts/compact.bat"
      ]
    }
  ],
  "post-processors": [
    {
      "type": "vagrant",
      "keep_input_artifact": false,
      "output": "windows_2016_{{.Provider}}.box",
      "vagrantfile_template": "vagrantfile-windows_2016.template"
    }
  ],
  "variables": {
    "iso_url": "http://care.dlservice.microsoft.com/dl/download/1/4/9/149D5452-9B29-4274-B6B3-5361DBDA30BC/14393.0.161119-1705.RS1_REFRESH_SERVER_EVAL_X64FRE_EN-US.ISO",
    "iso_checksum_type": "md5",
    "iso_checksum": "70721288bbcdfe3239d8f8c0fae55f1f",
    "autounattend": "./answer_files/2016/Autounattend.xml"
  }
}
```

Het is ook mogelijk een lokale iso te gebruiken, plaats deze in de <b>packer-windows</b> folder en geef de bestandsnaam mee bij de `iso-url`variabele. Verander hierbij het checksum-type naar `none` indien de checksum niet gekend is.

Type nu in cmder:

```
cd c:\vagrant\packer-windows
packer build -only virtualbox-iso windows_2016.json
```
Wacht tot deze operatie klaar is... (~2 uur)

## Stap 3: Toevoegen van de box aan Vagrant

Een box-file is nu gecreeërd in de <b>packer-windows</b> folder.

Type in cmder:

```
cd c:\vagrant\packer-windows
vagrant box add --name windows_2016 windows_2016_virtualbox.box
```

De box is nu toegevoegd in: <b>C:\Users\\.vagrant.d\boxes\windows_2016\0\virtualbox</b> .

De box-file in de folder <b>packer-windows</b> is nu niet langer nodig.

## Stap 4: Starten van de virtuele server

Ga naar `c:\Vagrant` en maak een folder voor de server (hier `ProjectServer`) .

Type nu in cmder:
```
cd c:\Vagrant\ProjectServer\
vagrant init
```

Pas de Vagrantfile aan zodat deze er als volgt uit ziet:

```
Vagrant.require_version ">= 1.6.2"
 
$root_provision_script = <<'ROOT_PROVISION_SCRIPT'
& $env:windir\system32\tzutil /s "W. Europe Standard Time"
ROOT_PROVISION_SCRIPT
 
Vagrant.configure("2") do |config|
    config.vm.define "ProjectServer"
    config.vm.box = "windows_2016"
    config.vm.hostname = "ProjectServer"
 
 
    config.vm.provider :virtualbox do |v, override|
        v.gui = true
        v.customize ["modifyvm", :id, "--memory", 2048]
        v.customize ["modifyvm", :id, "--cpus", 2]
    end
 
    config.vm.network "private_network", ip: "10.10.10.4"
    config.vm.provision "shell", inline: $root_provision_script
	  config.vm.provision "shell", path: "setup.ps1"
end
```

Sla dit op.

### Het gebruik van de server

Inloggen op de box kan via: `vagrant rdp` (username & password: vagrant).

Om de box te pauzeren type: `vagrant halt`.

Om de box te verwijderen type: `vagrant destroy`.

Via `vagrant up` heb je binnen enkele seconden terug een 'cleane' server.

Gebruik `vagrant global-status` om een lijst van je vagrant-servers weer te geven.

Gebruik `vagrant global-status --prune` in geval je een 'zombie box' hebt.

Om meerdere servers te creeëren, pas de Vagrantfile aan (server naam, IP adres).

## Stap 5: Verdere installatie van de server en toevoegen WISA-stack via het powershell script
*Maak dit script aan onder de naam `setup.ps1`. Zorg dat dit bestand in de map van de vagrant file staat. Daarna bent U klaar om `vagrant up` te typen.*
```
#Script opzetten WISA stack op vagrant server
#=============================================
Write-Host "Dit script zal voor U automatische een WISA Stack configureren."
Write-Host "Voor de Installatie is een internet verbinding verijst."
Write-Host "De installatie duurt een 30 tot 40 minuten."
#Download URL
#===================
$urljava = "http://javadl.oracle.com/webapps/download/AutoDL?BundleId=230542_2f38c3b165be4555a1fa6e98c45e0808"

#Locations
#===================
$downloads = "C:\Users\vagrant\Downloads"

#WebClient
#===================
$clnt = New-Object System.Net.WebClient

#Starten transcript om output van het script naar een file weg te schrijven.
#===================
$ErrorActionPreference="SilentlyContinue"
Stop-Transcript | out-null
$ErrorActionPreference = "Continue"
Start-Transcript -path c:\Users\vagrant\Desktop\output.txt -append

Get-Date > c:\Users\vagrant\Desktop\tijd.txt
#Deactiveren confirm meldingen
#===================
$ConfirmPreference="none"

#Commandos uitvoeren bij de vagrant user
#===================
cd c:\Users\vagrant

#Azerty keyboard layout gebruiken
#===================
Write-Host "Aanpassen keyboardlayout naar Azerty..."
Set-WinUserLanguageList -LanguageList NL-BE -Confirm:$false -force
Write-Host "Keyboardlayout aangepast." -ForegroundColor Green

#24 uur tijdsnotatie
#===================
Write-Host "Instellen van datum- en tijdsnotatie..."
#Lang
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sTimeFormat -Value "HH:mm:ss" -Confirm:$false -force
Write-Host "Lange tijdsnotatie ingesteld." -ForegroundColor Green
#Kort
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortTime -Value "HH:mm" -Confirm:$false -force
Write-Host "Korte tijdsnotatie ingesteld." -ForegroundColor Green

#Datumnotatie veranderen
#===================
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value dd/MM/yy -Confirm:$false -force
Write-Host "Datumnotatie ingesteld." -ForegroundColor Green

#Toon scherminhoud bij het verplaatsen van een venster
#===================
Write-Host "Scherminhoud tonen bij het verplaatsen van vensters..."
Set-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name DragFullWindows -Value 1 -Confirm:$false -force
Write-Host "Scherminhoud wordt nu getoond na heropstarten." -ForegroundColor Green

#Licentie activeren van de windows server
#===================
Write-Host "Licentie van de windows server activeren... (~20min)"
Start-Service -Name "sppsvc"
sleep 10
Dism /online /Set-Edition:ServerStandard /AcceptEula /ProductKey:FRK8N-3TK46-8CGJT-XCPMC-2DMKR /NoRestart /Quiet
write-Host "Licentie van de windows server is geactiveerd." -ForegroundColor Green

#Installeren IIS
#===================
Write-Host "Beginnen IIS installatie..."
install-windowsfeature -name Web-Server -includeallsubfeature -IncludeManagementTools -Confirm:$false
Write-Host "IIS geinstalleerd." -ForegroundColor Green

#Installeren .NET Frameworks
#===================
Write-Host "Beginnen .NET frameworks installatie..."
install-windowsfeature -name NET-Framework-Features -includeallsubfeature -Confirm:$false
install-windowsfeature -name NET-Framework-45-Features -includeallsubfeature -Confirm:$false
Write-Host ".NET frameworks geinstalleerd." -ForegroundColor Green

#Installeren Sqlserver standalone
#===================
$command = "C:\SQLServer2017Media\ExpressAdv_ENU\SETUP.EXE /SQLSYSADMINACCOUNTS=$($env:COMPUTERNAME)\$($env:USERNAME) /ConfigurationFile=C:\vagrant\ConfigurationFile.ini"

write-host "Downloading Java EXE..."
$clnt.DownloadFile($urljava,"$downloads\jre-8u161-windows-x64.exe")
Write-Host "Java EXE download completed!" -ForegroundColor Green
Write-Host "Bezig met installeren van java extensie..."
Start-Process $downloads\jre-8u161-windows-x64.exe /quiet
Write-Host "Java extensie geinstalleerd!" -ForegroundColor Green
#
Write-Host "Bezig met installeren van SQL Express Server..."
if (!(Test-Path C:\SQLServer2017Media)){
write-host "Bestanden kopieren..."
copy-Item C:\vagrant\SQLServer2017Media\ -Destination "C:\SQLServer2017Media\" -Recurse
Write-Host "Kopieren voltooid" -ForegroundColor Green
}
Write-Host "Installeren..."
Invoke-Expression -Command $command
Write-Host "Sqlserver geinstalleerd!" -ForegroundColor Green


#Locations
#===================
$downloads = "C:\Users\vagrant\Downloads"

#Download URL
#===================
$urlssms = "https://go.microsoft.com/fwlink/?linkid=870039"

#WebClient
#===================
$clnt = New-Object System.Net.WebClient

#Installatie SSMS
#===================
$filepath="$downloads\SSMS-Setup-ENU.exe"
#
write-host "Downloading SQL Server 2017 SSMS..."
$clnt.DownloadFile($urlssms,"$filepath")
#copy-Item C:\vagrant\SSMS-Setup-ENU.exe -Destination $filepath -Recurse
Write-Host "Beginnen SSMS installatie... (~7min, enkel installatie)"
$Parms = " /Install /Quiet /Norestart /Logs log.txt"
$Prms = $Parms.Split(" ")
& "$filepath" $Prms | Out-Null
Write-Host "SSMS installatie voltooid!" -ForegroundColor Green



#Einde script
#===================

Write-Host "Het script is succesvol uitgevoerd!"
Get-Date >> c:\Users\vagrant\Desktop\tijd.txt
#Stoppen transcript
#===================

Stop-Transcript

#De server herstarten om alle instellingen te activeren
#===================

Write-Host "Herstarten server om instellingen te activeren..."
sleep 2
Restart-Computer
```





















