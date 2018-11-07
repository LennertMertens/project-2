# Test Rapport Lab 4: Basic Static Route Configuration
## Alle te testen onderdelen in secties onderverdeeld: 

### Task 1: Cable, Erase, and Reload the Routers. (Op R1, R2 en R3)
- [x] Router was in het begin gereset.
* Aangezien ik geen vorige configuratie aantref, is dit geen probleem.

### Task 2: Perform Basic Router Configuration. (Op R1, R2 en R3)
- [x] Hostnaam is correct.
* Alle drie de hostnames kloppen.
- [x] Domain-lookup staat uit.
* Getest via het commando 'show run | include domain-lookup' .
- [x] User EXEC password 'cisco' is gezet.
* Wachtwoord klopt
- [x] Privileged EXEC 'class' is gezet.
* Wachtwoord klopt
- [x] Paswoord voor de virtual lines 'cisco' is gezet.
* Wachtowoord klopt
- [x] De exec-timeout staat correct voor de console.
* komt overeen met running config
- [x] De exec-timeout staat correct voor de virtual lines.
* komt overeen met running config

### Task 3: Interpreting Debug Output.
- [x] De clock rate op R1 staat correct.
* komt overeen met running config

### Task 5: Configure IP Addressing on the Host PCs.
- [x] Het ip adres van PC1 is correct.
* klopt met de ip instellingen
- [x] De default gateway van PC1 is correct.
* klopt met de ip instellingen
- [x] Het ip adres van PC2 is correct.
* klopt met de ip instellingen
- [x] De default gateway van PC2 is correct.
* klopt met de ip instellingen
- [x] Het ip adres van PC3 is correct.
* klopt met de ip instellingen
- [x] De default gateway van PC3 is correct.
* klopt met de ip instellingen

### Task 6: Test and Verify the Configurations.
- [x] Pingen naar de default gateway van PC1 lukt.
* 100%
- [x] Pingen naar de default gateway van PC2 lukt.
* 100%
- [x] Pingen naar de default gateway van PC3 lukt.
* 100%
- [x] Pingen van R2 naar R1 op 172.16.2.1 lukt.
* 100%
- [x] Pingen van R2 naar R3 op 192.168.1.1 lukt.
* 100%

### Task 8: Configure a Static Route Using a Next-Hop Address.
- [x] Pingen van PC3 naar PC2 lukt.
* 100%

### Task 10: Configure a Default Static Route.
- [x] Pingen van PC2 naar PC1 lukt.
* 100% van de paketten komen toe...

### Task 11: Configure a Summary Static Route.
- [x] Alle routes op R1 zijn correct.
* Komt overeen met de screenshot op pagina 15 van de opdracht
- [x] Alle routes op R2 zijn correct.
* Komt overeen met de screenshot op pagina 14 van de opdracht
- [x] Alle routes op R3 zijn correct.
* Komt overeen met de screenshot op pagina 17 van de opdracht
- [x] Pingen van PC3 naar PC1 lukt.
* 100% van de paketten komen toe...

Auteur(s) testplan: Maximilan Leire
Tester: Jens Neirynck
