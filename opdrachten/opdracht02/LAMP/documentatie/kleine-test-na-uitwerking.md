# Opdracht 02 - LAMP - Testje na uitwerking script en configuratiefile

## Geteste delen

| Tested        | Result        | 
| ------------- |:-------------:| 
| vagrantConfig.sh wordt uitgevoerd | OK |
| lampStack.sh wordt uitgevoerd | OK |
| vagrantConfig wordt vóór lampStack.sh uitgevoerd | OK |
| Variabelen uit de config file kunnen in lampStack.sh worden gebruikt | OK |
| Script wordt volledig uitgevoerd | OK |
| Root wachtwoord wordt opnieuw ingesteld | Niet OK |
| MySQL wachtwoord wordt opnieuw ingesteld | Niet OK |
| Host systeem kan de webserver bereiken |OK |

## Bugs stacktrace
### MySQL wachtwoord incorrect ingesteld
```
 default: Setting the root password ensures that nobody can log into the MariaDB
    default: root user without the proper authorisation.
    default:
    default: Set root password? [Y/n]
    default: stty: 'standard input'
    default: : Inappropriate ioctl for device
    default: New password:
    default: Re-enter new password:
    default: stty: 'standard input': Inappropriate ioctl for device
    default: Password updated successfully!
    default: Reloading privilege tables..
    default:  ... Success!
    ...
    default: All done!  If you've completed all of the above steps, your MariaDB
    default: installation should now be secure.

```

### Probleem met drupal8 in script
```
 default: /home/vagrant/lampStack.sh: line 70: [drupal8: command not found
```

### Root wachtwoord wordt niet correct opnieuw ingesteld
```
 default: Passwoord wijzigen
    default: New password: BAD PASSWORD: The password contains the user name in some form
    default: Retype new password: Sorry, passwords do not match.
    default: New password: BAD PASSWORD: The password contains the user name in some form
    default: Retype new password: Sorry, passwords do not match.
    default: New password: Password change aborted.
    default: passwd: Have exhausted maximum number of retries for service
    default: Changing password for user root.
```

Auteur test: `Lennert Mertens`
