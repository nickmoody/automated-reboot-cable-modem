# automated-reboot-cable-modem
Automating the reboot of a cable modem should the internet be unreachable
<br>
Requirements:
<br>
1) reboot_modem.sh bash script<br>
2) reboot_modem.exp expect sript<br>
3) APC PDU<br>
<br>
The bash script checks availabilty of a server and if considered down will execute an expect script which will telnet to an APC PDU
and cycle the power to an outlet.
