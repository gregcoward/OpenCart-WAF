#!/bin/bash
###########################################################################
##       ffff55555                                                       ##
##     ffffffff555555                                                    ##
##   fff      f5    55         Deployment Script Version 0.0.1           ##
##  ff    fffff     555                                                  ##
##  ff    fffff f555555                                                  ##
## fff       f  f5555555             Written By: Gregory Coward          ##
## f        ff  f5555555                                                 ##
## fff   ffff       f555             Date Created: 07/17/2018            ##
## fff    fff5555    555             Last Updated: 07/17/2018            ##
##  ff    fff 55555  55                                                  ##
##   f    fff  555   5       This script will deploy, via jenkins        ##
##   f    fff       55       OpenCart and WAF configuration.              ##
##    ffffffff5555555                                                    ##
##       fffffff55                                                       ##
###########################################################################
###########################################################################
##                              Change Log                               ##
###########################################################################
## Version #     Name       #                    NOTES                   ##
###########################################################################
## 11/23/15#  Thomas Stanley#    Created base functionality              ##
###########################################################################
## 09/2/16#  Gregory Coward#    Modified to work with Cloud Try          ##
###########################################################################

### Parameter Legend  ###
## devicevar=0 #rgName
## devicevar=1 #namePrefix
## devicevar=2 #location
## devicevar=3 #vmSize
## devicevar=4 #storageAccountName
## devicevar=5 #storageAccountKey

## securevar=0 #adminUserName
## securevar=1 #adminPassword
## securevar=2 #securityBlockingLevel

## licvar=0 #licenseToken1
## licvar=1 #licenseToken2

## Build the arrays based on the semicolon delimited command line argument passed from json template.
IFS=';' read -ra devicevar <<< "$1"
IFS=';' read -ra securevar <<< "$2"
IFS=';' read -ra licvar <<< "$3"

# Create a resource group.
az group create -l eastus -n ${devicevar[0]}

# Create OpenCart deployment
az group deployment create  \
    --resource-group f5demo-application \
    --template-uri "https://raw.githubusercontent.com/gregcoward/OpenCart-WAF/master/OpenCart-WAF/openCartInfrastructureTemplate.json"
    --parameters location="${devicevar[2]}" namePrefix="${devicevar[1]}"
