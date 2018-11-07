`import-module servermanager
add-windowsfeature web-server -includeallsubfeature`


### Voor de 'benodigde' opties:

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

### Links:
* http://tritoneco.com/2014/02/21/fix-for-powershell-script-not-digitally-signed/
* https://docs.microsoft.com/en-us/iis/install/installing-iis-85/installing-iis-85-on-windows-server-2012-r2
* https://technet.microsoft.com/en-us/library/hh867899(v=wps.630).aspx
* https://www.howtogeek.com/117192/how-to-run-powershell-commands-on-remote-computers/
* https://www.youtube.com/watch?v=q-RP4_ULGdo
