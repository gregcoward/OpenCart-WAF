pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                powershell 'az login --service-principal -u "http://azure-cli-2018-07-09-16-31-25" -p "8f7d17c4-e6db-41dc-8797-9fa1b9d537a1" --tenant "3254cd50-e46e-4a72-9d0c-504f2740f425"'
                powershell 'az group deployment create  --resource-group $($env:rgName) --mode Incremental --template-uri "https://raw.githubusercontent.com/gregcoward/OpenCart-WAF/master/OpenCart-WAF/openCartSlave-WAFTemplate.json" --parameters location="$($env:location)" namePrefix="$($env:namePrefix)" adminUsername="$($env:adminUserName)" adminPassword="$($env:adminPassword)" licenseToken2="$($env:licenseToken2)" appAddress1="$($env:appAddress1)" appAddress2="$($env:appAddress2)" applicationType="$($env:applicationType)" securityBlockingLevel="$($env:securityBlockingLevel)" storageAccountName="$($env:storageAccountName)" storageAccountKey="$($env:storageAccountKey)" applicationCertificate="$($env:applicationCertificate)" applicationKey="$($env:applicationKey)" applicationChain="$($env:applicationChain)"'
           


            }
        }
    }
}
