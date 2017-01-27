#!/bin/bash
# reboot_modem.sh
# This script by default will connect to an APC PDU via telnet and reboot an outlet
# As telnet is used this script should run in a closed lab environment only
# Author - Nick Moody - netassured.co.uk
# Last Updated 11/01/2017 
#
# REQUIRMENTS
# 1) Logon Credentials for the APC PDU
# 4) accompanying expect script found here: [INSERT LINK HERE]
#
# CONFIGRATION OPTIONS
# PDU
pdu_address="INSERT IP OR NAME OF PDU HERE"
pdu_outlet="INSERT PDU OUTLET NUMBER HERE"
username="INSERTUSERNAMEHERE"
password="INSERTPASSWORDHERE"
# Remote Server IP
remote_server="INSERT REMOTE SERVER IP HERE"
#
#
# ADDITIONAL VARIABLES - Ammend as per your requirements
# Set the date:
date="$(date +%Y%m%d-%H%M%S)"
# Name of the log file:
logfile="/Scripts/reboot_modem.log"
#
# SHOULDNT NEED TO MODIFY PAST THIS POINT #
# Timestamp execution of the script
printf "########## Start of logs for script executed @ $date ##########\n" >> "$logfile"
# Check the logon credentials has been specified:
if [ "$username" == "INSERTUSERNAMEHERE" ]	
then
printf "Please insert your logon credentials under configuration options!\n" | tee -a "$logfile" & exit 1
fi
# Check if remote server is reachable
if ping -q -c 10 -W 1 $remote_server >/dev/null; then
printf "Remote server is up\n" | tee -a "$logfile"
else
 printf "Remote server is down, executing the expect script to reboot the modem\n" | tee -a "$logfile"
 # Feed the expect script the variables
 /Scripts/./reboot_modem.exp $pdu_address $pdu_outlet $username $password 
fi
