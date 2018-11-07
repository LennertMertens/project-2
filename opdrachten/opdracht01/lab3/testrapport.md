# Testplan Lab 3: Building a switch and router network

Tester: Max Leire

## Alle te testen onderdelen in secties onderverdeeld: 

### Deel 1 Configuratie PC-A, PC-B en switch
- [x] PC-A is beschikbaar en draait
 * Command prompt beschikbaar
- [x] PC-A heeft een correct ip adres en subnetmask
 * Gecontroleerd op ip configuration pagina, komt overeen met de opdracht.
- [x] PC-A heeft een correcte default gateway
 * Gecontroleerd op ip configuration pagina, komt overeen met de opdracht.
- [x] PC-B is beschikbaar en draait
 * Command prompt beschikbaar
- [x] PC-B heeft een correct ip adres en subnetmask
 * Gecontroleerd op ip configuration pagina, komt overeen met de opdracht.
- [x] PC-B heeft een correcte default gateway
 * Gecontroleerd op ip configuration pagina, komt overeen met de opdracht.
- [x] Switch is beschikbaar en draait
 * De CLI is beschikbaar.

### Deel 2 Configuratie Router

- [x] R1 heeft de correcte hostname
 * Gecontroleerd op de config pagina, komt overeen met de opdracht.
- [x] R1 heeft DNS lookup disabled
 * Getest via het commando 'show run | include domain-lookup' .
- [x] R1 heeft het correcte Privileged EXEC encrypted password
 * Succesvol privileged exec modus kunnen starten met het wachtwoord 'class' .
- [x] R1 heeft het correcte console password, en login is enabled
 * Succesvol ingelogd met 'cisco' .
- [x] R1 heeft het correcte VTY password, en login is enabled
 * gecontroleerd via het commando 'show running-config'.
- [x] De wachtwoorden zijn geëncrypteerd
 * Getest via het commando 'show tech-support' .
- [x] R1 heeft een banner
 * Deze wordt getoond bij het opstarten van de CLI.
- [x] G0/0 en G0/1 zijn geactiveerd
 * Gecontroleerd bij GUI interface.
- [x] G0/0 en G0/1 hebben een beschrijving
 * Gecontroleerd via het commando 'show interface g0/1 en show interface g0/2'.
- [x] De clock werd ingesteld
 * Getest via het 'show clock' commando.
- [x] PC-A kan pingen naar PC-B
 * ping 192.168.0.3 op PC-A -> reply ontvangen
- [x] PC-B kan pingen naar PC-A
 * ping 192.168.1.3 op PC-B -> reply ontvangen

### Deel 3 Opvragen informatie

- [x] IOS image naam is correct van de router
 * Gecontroleerd via het commando 'show version' .
- [x] DRAM is correct van de router
 * Succesvol gecontroleerd via het commando 'show version' .
- [x] NVRAM is correct van de router
 * Gecontroleerd via het commando 'show version' .
- [x] Flash is correct van de router
 * Gecontroleerd via het commando 'show version' .
- [x] IOS image naam is correct van de switch
 * Gecontroleerd via het commando 'show version' .
- [x] DRAM is correct van de switch
 * Succesvol gecontroleerd via het commando 'show version' .
- [x] NVRAM is correct van de switch
 * Succesvol gecontroleerd via het commando 'dir nvram'.
- [x] Model Nr is Correct van de switch
 * Succesvol gecontroleerd via het commando 'dir nvram'.
- [x] Directly Connected network code klopt
 * Gecontroleerd via het commando 'show ip route'.
- [x] Aantal routes gelinkt aan C klopt
 * Gecontroleerd via het commando 'show ip route'.
- [x] Interface type klopt
 * Gecontroleerd via het commando 'show ip route'.
- [x] Status van G0/1 is correct
 * Gecontroleerd via het commando 'show interface g0/1'.
- [x] Mac van G0/1 is correct
 * Gecontroleerd via het commando 'show interface g0/1'.
- [x] IP adress van G0/1 klopt
 * Gecontroleerd via het commando 'show interface g0/1'.
- [x] Screenshots van show ip interface brief zijn juist
 * Gecontroleerd via het commando 'show ip interface brief'.

(Voeg eventuele commentaren toe bij onduidelijkheden/fouten)

Auteur(s) testplan: Jens Neirynck


