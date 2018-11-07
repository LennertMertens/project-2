# Testrapport Lab 1: Establishing a Console Session with Tera Term

## Alle te testen onderdelen in secties onderverdeeld: 

### Connectie met Switch

- [X] PC is beschikbaar en draait
- [X] Switch is beschikbaar en draait
- [X] Switch en PC zijn verbonden met rollover Console Cable
- [X] Connectie via een Terminal Emulation program is mogelijk voor de configuratie van de switch
- [ ] De clock werd ingesteld (moet overeenkomen met huidige datum/tijd)

=> Ik Heb het commando `show clock` uitgevoerd. Met dit als resultaat:

* Switch>`show clock`
* `*0:8:53.870 UTC Mon Mar 1 1993`
* Switch>

**[Update 25/02/2018]**
  De Clock kan worden ingesteld maar wanneer het netwerkapparaat opnieuw wordt opgestart/uitvalt dan verliest het ook de kennis van de huidige date/time. Dit is een vaak voorkomend probleem bij Cisco apparaten dat te wijten is aan het ontbreken van een batterij in het apparaat. De Clock moet dus telkens opnieuw worden ingesteld.
  
Auteur(s) testrapport: Kenzie Coddens
