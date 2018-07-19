pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                powershell 'az group deployment create  --resource-group $($env:rgName) --mode Incremental --template-uri "https://raw.githubusercontent.com/gregcoward/OpenCart-WAF/master/OpenCart-WAF/openCartWebTemplate.json" --parameters location="$($env:location)" namePrefix="$($env:namePrefix)" vmSize="$($env:vmSize)" adminUsername="$($env:adminUserName)" adminPassword="$($env:adminPassword)"'
            }
        }
    }
}
